Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C02EC04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 10:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C851910E505;
	Mon, 20 May 2024 10:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoASLCyR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C029310E505
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 10:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716201567; x=1747737567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uXGpn2JNikysIWQYp27MBVmpU1vps5AjMTU4VmCw8hc=;
 b=BoASLCyRzEui2bbE8EuJ1T9Fr9TqpOcz7hbkgdigMB/oevzJpb6ohapU
 r8rOlvu545gGug95gpAXrqXQtmuMEaoGTMJlmAdiijqk5S2g/zdfcezAZ
 Dux2/kthVdpI1EdgLDTSj40lXcSlAv48Q22lNLS1Z+M5MK52lckQ9MSZr
 XtXdlhYTLBGfz7qmgMGRhK3gMR/kokjgWwx8P4kIrfotLA9zwchxE5rtr
 oqhrBAnahjaxzmVEl2ZDElQnq+i6hwuv+N+vBiPL3m0euz9ktIUKI1wSh
 wNOZ1BRkkpnLB+3m+u/laF2Fg4JkgdO2cFe5aLhTLe7diYqCcCDDuvE8g Q==;
X-CSE-ConnectionGUID: KlPsApacQ32PLGeeUMQ+Tw==
X-CSE-MsgGUID: MhRGYtt9QS27Fw6QNf0ZUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12262128"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="12262128"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 03:39:26 -0700
X-CSE-ConnectionGUID: MJ+QzkVJRxCxXu7HS0dz7w==
X-CSE-MsgGUID: h+ECoTjfTAK3q8r4hi8OCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="32625455"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 03:39:25 -0700
Date: Mon, 20 May 2024 12:39:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>, karthik.b.s@intel.com,
 jeevan.b@intel.com, sameer.lattannavar@intel.com
Subject: Re: [PATCH i-g-t v3] tests/intel/kms_big_fb: Restrict runs on
 simulation
Message-ID: <20240520103908.u5zguzkhwxfvgqae@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pranay Samala <pranay.samala@intel.com>, karthik.b.s@intel.com,
 jeevan.b@intel.com, sameer.lattannavar@intel.com
References: <20240520050155.435110-1-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240520050155.435110-1-pranay.samala@intel.com>
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
On 2024-05-20 at 10:31:55 +0530, Pranay Samala wrote:
> This test executes on only one pipe and all the available planes with
> set of 6 coordinates. Due to this, test takes long duration to execute
> on simulation and gets timeout.
> 
> Restricting the test to execute only on one of the coordinates for
> simulation.

Now it looks much better, I still have one ask for improvement,
see below.

> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_big_fb.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 1e45d8e42..502905974 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -529,6 +529,9 @@ static bool test_plane(data_t *data)
>  
>  		igt_assert_crc_equal(&big_crc, &small_crc);
>  		igt_pipe_crc_stop(data->pipe_crc);
> +
> +		if (igt_run_in_simulation())
> +			break;

Please move this to just after for(...) loop begins, the argument
it is much more easier to read, second is it will allow easily
modify it if you want to test (x,y) instead of (0,0). You could
reuse your conscept with var here, also add comment, so imho it
would be better:

At begin of this function, put:
	bool run_in_simulation = igt_run_in_simulation();

At for loop:    

for (int i = 0; i < ARRAY_SIZE(coords); i++) {
    igt_crc_t small_crc, big_crc;
    int x = coords[i].x;
    int y = coords[i].y;

    /* Limit running time on simulation to (0,0) */
    if (run_in_simulation && i > 0)
            break;

So now you could also easily change this into:

    int x;
    int y;

    /* Limit running time on simulation to (x,y) */
    if (run_in_simulation)
            i = ARRAY_SIZE(coords) - 1;

    x = coords[i].x;
    y = coords[i].y;

Or use both (0,0) and (x,y) on simulation.

Regards,
Kamil

>  	}
>  
>  	return true;
> @@ -540,6 +543,7 @@ static bool test_pipe(data_t *data)
>  	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
>  	bool ret = false;
> +	bool run_in_simulation = igt_run_in_simulation();
>  
>  	igt_info("Using (pipe %s + %s) to run the subtest.\n",
>  		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
> @@ -597,7 +601,7 @@ static bool test_pipe(data_t *data)
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
