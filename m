Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455ACC282DE
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 19:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01AE10E09C;
	Thu,  6 Mar 2025 19:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1cy3eln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440A710EA7F
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 19:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741287697; x=1772823697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zwHiXIq8knPWbknTYrMTPJnxHm0lgKtHKHDlk8KpIUw=;
 b=k1cy3elnwsiFAchfkMAxJDvNy64Y8b9yzuF3PH86NXBzJGPYcL8FcnfC
 efVokDyjep5hVhiNfEIpKeIwGOth2DnGxpZrYP8yyV8hxTYTHZmVK/Yqf
 uM3AmXiQTvJfKB4GxN/yvP59S646Iw9gw1CL1vqD5tNQz9bx5fMj5pgJO
 ZwKxHXnqw9tKTEsaF/b3AqduZrzQQKNFT01Q+PYCV/ifLNCPqeuencfQO
 BQhBrp2dGUJN+koj7ZlL/E5II0QU8wO2Qn4/p22OdWGRJ9btwzGwxqHEM
 0hkYLyfrIMPs7Vwc7plCmicv56BKu1C6BVU67jf1owPo5LaLjWKQ9TdFN A==;
X-CSE-ConnectionGUID: NRlCUvT9QVuvVcoCZwGmvQ==
X-CSE-MsgGUID: dbxUsmGQSHCxlHcIuN/T4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67693662"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="67693662"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 11:01:37 -0800
X-CSE-ConnectionGUID: 8hpCjf3CRym/h2A4WrQvwA==
X-CSE-MsgGUID: bz8oLJtEQ+2swB0Y/G02Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="123705156"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 11:01:35 -0800
Date: Thu, 6 Mar 2025 20:01:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_dp_link_training: Add missing
 DRIVER_XE
Message-ID: <20250306190118.3wr3rgk4yg2htzn4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
References: <20250306152552.1620737-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250306152552.1620737-1-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-03-06 at 16:25:52 +0100, Marcin Bernatowicz wrote:
> Commit d7bccece44dd ("tests/intel/kms_dp_link_training: Restrict to Intel
> GPUs") missed adding DRIVER_XE. Ensure both DRIVER_INTEL and DRIVER_XE
> are set to properly restrict the test to Intel GPUs.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>

Applied, thank you.

Regards,
Kamil

> ---
>  tests/intel/kms_dp_link_training.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
> index 7d3848b94..3df7b6562 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -335,7 +335,7 @@ igt_main
>  	data_t data = {};
>  
>  	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>  		data.devid = intel_get_drm_devid(data.drm_fd);
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
> -- 
> 2.31.1
> 
