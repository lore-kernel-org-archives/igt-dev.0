Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190DBCF856E
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 15:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EA910E779;
	Thu, 20 Nov 2025 15:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yls9UdRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B0010E77A
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763653617; x=1795189617;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tGZC4bKNooDEpJyqWB4amDcpY4Dxf8AxqDTL1LnrUSM=;
 b=Yls9UdRPaIF9FF+SuXSPkhBAZtnN87bdb79OW3aA7i6SG6vtvIee/Eei
 H79HqGm1HMwb4Ssyvo2r46UdIR3hQl6rGt9af9cnil+DcHKRMVx9cEarK
 N4wfl1tsa82ahMjatIPXNs1f2LQ/YKVwGJwQRO9RSeb7OJmdsyGWJG57y
 xbjv0m4YxHmOWn6lFMqbJ9czwVPC6tBCLKYH+q7dE0EXdK/mffeGCnjsG
 yLIp0F58V/mCuTQgMEoDbCzeM3jycQeAGyOImKnwDoMQ+7ITclw6wptI9
 Dxg79dMZzHyKPLRJf7VnhQitqrnUMdnx/kYuqinWGFcX6121EmxmI1WAE g==;
X-CSE-ConnectionGUID: 7SgWb33GTPKqTI/fIvXwtw==
X-CSE-MsgGUID: 8NMajDibTWiGqlkP655Wdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76055363"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76055363"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 07:46:57 -0800
X-CSE-ConnectionGUID: MqrctIgYTtWdyXWBGRupXA==
X-CSE-MsgGUID: 0iUUHibMQQqiblvI5D+ebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="222348572"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 07:46:55 -0800
Date: Thu, 20 Nov 2025 16:46:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
Cc: igt-dev@lists.freedesktop.org, Xin Wang <x.wang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] tests/intel/xe_pat: switch PAT tests to igt_srandom()
Message-ID: <20251120154637.xjaelakr6cu3kxq6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>, igt-dev@lists.freedesktop.org,
 Xin Wang <x.wang@intel.com>, Matthew Auld <matthew.auld@intel.com>
References: <20251119231900.3797119-1-zongyao.bai@intel.com>
 <20251119231900.3797119-2-zongyao.bai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119231900.3797119-2-zongyao.bai@intel.com>
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

Hi Zongyao,
On 2025-11-19 at 23:18:59 +0000, Zongyao Bai wrote:
> For consistency with the igt framework, use igt_srandom() to generate
> random seed instead of srand().
> 
> v2:
>   In the IGT framework, each running test case is initialized through
>   common_init(), which has called igt_srandom(), additional calls are
>   not needed. (Kamil)
> 
> Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Xin Wang <x.wang@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_pat.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 59dfb6b11..4294af71c 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -1161,15 +1161,8 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
>  	int fd;
>  
>  	igt_fixture {
> -		uint32_t seed;
> -
>  		fd = drm_open_driver(DRIVER_XE);
>  		dev_id = intel_get_drm_devid(fd);
> -
> -		seed = time(NULL);
> -		srand(seed);
> -		igt_debug("seed: %d\n", seed);
> -
>  		xe_device_get(fd);
>  	}
>  
> -- 
> 2.43.0
> 
