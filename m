Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241D8EB1060
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 15:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC1010E160;
	Tue, 10 Mar 2026 15:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StlSEH55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A9A10E160
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 15:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773155511; x=1804691511;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Nvi9INoTvUWsKtGam/VbNBIfX86cc+d2USTmZo+uXEI=;
 b=StlSEH55ro7QQZuodYEEOaT/7+O8g1AEWrm+2BXgvd4tyw6wKpc35xeL
 6XwEErNNJz1b5nCwikPaljXsKiGtlMSL0IibbVtZtCb01dV6puvrCFrgc
 rkz8ngFDKIeZih/uet+iYokRgB4NxVHc2zHTJMOPdq9/SjaPzngcdvAjs
 /Pta7m99J4li3EqPPdSXD5IY5NHhKfu7ZBx5T4BIQkeuzmJhxXwxCEzbD
 rdcfoRlQY9LmhqMCbJ/r2b/sG48P6KefQjQUkFGjh5zdhwdVrVwYQi+U7
 rI/UKC5/FGAd9PUOcAo6zW3BXGlGY9mQFw8ZfdzoIZosGhSq7rCkie5px g==;
X-CSE-ConnectionGUID: ZB1n+YH6ROKhLj+1rXjRVA==
X-CSE-MsgGUID: 8ZqUD3QBTXWTID7eAGYchw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74249528"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74249528"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:11:50 -0700
X-CSE-ConnectionGUID: a9KbpnFISZGG1+VV0AX8Mg==
X-CSE-MsgGUID: /zmweJhuRfqDPtG4JoMKnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="243161095"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.6])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:11:48 -0700
Date: Tue, 10 Mar 2026 16:11:46 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, Nishit Sharma <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t, v1] tests/intel/xe_exec_system_allocator: Comment
 compute output buffer
Message-ID: <jevu4e35gbk7trp22meoypcxisejwyqnsxdo3dlkfqmrty7aed@xwvc4vt43v5t>
References: <20260309163736.1299062-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309163736.1299062-1-francois.dugast@intel.com>
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

On Mon, Mar 09, 2026 at 05:37:36PM +0100, Francois Dugast wrote:
> Add a comment why the output buffer allocation differs from the input
> one so that it is not changed by accident in the future.

Thanks, LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index bf3330002..c645f6491 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2292,6 +2292,14 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  	read_gt_stats_snapshot(fd, eci, &stats_before);
>  
>  	for (int i = 0; i < loops; i++) {
> +		/*
> +		 * What is done below for the input buffer could also be done for the output
> +		 * buffer, that is system allocation with aligned_alloc() then setting it into
> +		 * user_execenv. However the current focus of this test is to provide fine
> +		 * control on triggering GPU page faults from the context of a compute kernel
> +		 * (execution units) unlike test_exec(), so using SVM for the input buffer only
> +		 * is sufficient and simpler.
> +		 */
>  		compute_input = aligned_alloc(size, size);
>  		igt_assert(compute_input);
>  		env.input_addr = to_user_pointer(compute_input);
> -- 
> 2.43.0
> 
