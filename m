Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCE1C83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 07:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5121210E770;
	Wed, 23 Jul 2025 07:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="altD/GuL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5562E10E770
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753256838; x=1784792838;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8G2za2va+lLGOxJNnNvrJKX6aRKULNXi3VFRF+xoKHE=;
 b=altD/GuL12rZwGzIbAPK1Q3n6hkrJdYglSMKnspPOPH6o+5g5j7Xwr3h
 gH45o1UZYTw6sTujtxhQ93w7hUuwOasOfmnsuh4kDjrba/hty1kg7uM8Q
 opDCL0X88DhUieehvSTECFmeS6HKMjwNayCC/gmlgEz7H7fI1lq+jEtRS
 FYTLBCYkByx1l7zyD25iNPZlOa3klKWcHtIq8T8L6sTKjURXUV8nS8xgp
 2n0ALPT2LWF4krXPJnUUoFh0ALsRuNR1EIGg6sM/1SOcQyfSonOM/Ewqt
 SIu3PbmiIEoe49wWY536VhqnTwqzPU34qDXe0vB5yCzOYgl1GiusOX+yU w==;
X-CSE-ConnectionGUID: w18typqDRv6q3nBd5dCtCA==
X-CSE-MsgGUID: RkrFC6yBRLue/Kghqa+xhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55483770"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55483770"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 00:47:18 -0700
X-CSE-ConnectionGUID: tLDyQPD9Qhas+snxyPUo9A==
X-CSE-MsgGUID: mIgfAJxvQnKNNomvzEqqPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="165009143"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 00:47:17 -0700
Date: Wed, 23 Jul 2025 09:47:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pranay Samala <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 sameer.lattannavar@intel.com
Subject: Re: [PATCH i-g-t] tests/kms_plane_alpha_blend: Reduce test
 complexity for simulation
Message-ID: <20250723074714.m7qby7w6msm3dq42@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pranay Samala <pranay.samala@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 sameer.lattannavar@intel.com
References: <20250719170838.1340070-1-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250719170838.1340070-1-pranay.samala@intel.com>
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
On 2025-07-19 at 22:38:38 +0530, Pranay Samala wrote:
> Reduce the number of plane alpha value iterations, and limit execution
> to a single plane for each pipe to enable this test on simulation.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/kms_plane_alpha_blend.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 047cc57b4..696bb1e5e 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -79,6 +79,8 @@ typedef struct {
>  	igt_pipe_crc_t *pipe_crc;
>  } data_t;
>  
> +static bool in_simulation;
> +
>  static void __draw_gradient(struct igt_fb *fb, int w, int h, double a, cairo_t *cr)
>  {
>  	cairo_pattern_t *pat;
> @@ -289,7 +291,7 @@ static void basic_alpha(data_t *data, enum pipe pipe, igt_plane_t *plane)
>  {
>  	igt_display_t *display = &data->display;
>  	igt_crc_t ref_crc, crc;
> -	int i;
> +	int i, max_alpha_value;
>  
>  	/* Testcase 1: alpha = 0.0, plane should be transparent. */
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> @@ -298,8 +300,10 @@ static void basic_alpha(data_t *data, enum pipe pipe, igt_plane_t *plane)
>  
>  	igt_plane_set_fb(plane, &data->argb_fb_0);
>  
> +	max_alpha_value = in_simulation ? 160 : 256;
> +
>  	/* transparent fb should be transparent, no matter what.. */
> -	for (i = 7; i < 256; i += 8) {
> +	for (i = 7; i < max_alpha_value; i += 8) {
>  		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, i | (i << 8));
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  
> @@ -564,6 +568,9 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
>  		igt_info("Testing plane %u\n", plane->index);
>  		test(data, pipe, plane);
>  		igt_plane_set_fb(plane, NULL);
> +
> +		if (in_simulation)
> +			break;
>  	}
>  
>  	igt_output_set_pipe(output, PIPE_NONE);
> @@ -743,6 +750,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		for_each_pipe(&data.display, pipe)
>  			active_pipes[last_pipe++] = pipe;
>  		last_pipe--;
> +
> +		in_simulation = igt_run_in_simulation();

Set this in first fixture in igt_main, not here.

Regards,
Kamil

>  	}
>  
>  	run_subtests(&data);
> -- 
> 2.34.1
> 
