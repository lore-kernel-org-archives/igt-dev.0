Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71775CDB46F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 12:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BD010E94E;
	Tue, 23 Jun 2026 12:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhAVWSqt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9513110EAE6
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 12:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782216326; x=1813752326;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DD/DRHWFKGMjjHZVwP9nsS0XJ4lLZhkT9aVCw2BIn3c=;
 b=EhAVWSqthIP5JfHIWxZYj8eusX4znbZ+3/pwtl9tyfrfS68MPvip8TFV
 F7DBWuFh/wwbWZWr3C5tEk7e1QtDEeApra/qbswTmb0X/ZClAqk0pP2TH
 HUxVNdOHX3+brsn0kckzLmGbA10HixPnDVADYoSR/h2ymhfUfeulY7CcW
 o3kJeP+viFE/PNTcFSKHNBcQPCubIohfMPvzeWPa04oe2UDEBBP/3rFHN
 ESUQl3ghiQRJU0nrtHQy4TdVLkplD7VMNg8jO9jZri0ahW7DcO1PPYiXy
 lDW7g6qhUEVmi2GlXpFoZOtVA3nAYxrSpmTY3zRlWJ9dAfrZAwqUB7NHH A==;
X-CSE-ConnectionGUID: /56Cf6PxRDa/O7J6A+5Ccg==
X-CSE-MsgGUID: P2/WtyKlQWqK43SxgGRnxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="83146604"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="83146604"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 05:05:26 -0700
X-CSE-ConnectionGUID: iKl+wj11SxaUHAqe0ZmDoQ==
X-CSE-MsgGUID: oAeU05aOTu6VIv7RxZc8gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="254484021"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 05:05:24 -0700
Date: Tue, 23 Jun 2026 14:05:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Ramalingeswara Reddy, Kanala" <Kanala.RamalingeswaraReddy@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly.Prosyak@amd.com,
 Christian.Koenig@amd.com, Pratik.Vishwakarma@amd.com
Subject: Re: [PATCH] tests/amdgpu/amd_security: Skip secure bounce test for
 APUs
Message-ID: <20260623120521.b7xs4ec5eecvvm4g@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Ramalingeswara Reddy, Kanala" <Kanala.RamalingeswaraReddy@amd.com>,
 igt-dev@lists.freedesktop.org, Vitaly.Prosyak@amd.com,
 Christian.Koenig@amd.com, Pratik.Vishwakarma@amd.com
References: <20260622040418.454076-1-Kanala.RamalingeswaraReddy@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622040418.454076-1-Kanala.RamalingeswaraReddy@amd.com>
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

Hi,
On 2026-06-22 at 09:34:18 +0530, Ramalingeswara Reddy, Kanala wrote:

one more nit, please subscribe to igt-dev mailing list
at fdo MLs page
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Regards,
Kamil


> Secure bounce test is not supported for APUs.
> 
> On dGPUs, TMZ works only on VRAM (local memory) but not on
> GTT (system memory) due to HW limitations, so this test validates bounce
> operation from VRAM to GTT and back to VRAM works on dGPUs.
> 
> Since APUs do not support this functionality, skip the test for APUs.
> 
> Signed-off-by: Ramalingeswara Reddy, Kanala <Kanala.RamalingeswaraReddy@amd.com>
> ---
>  tests/amdgpu/amd_security.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index 9ebb3fa83..2a8ae4a23 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -360,8 +360,12 @@ int igt_main()
>  	/* dynamic test based on sdma_info.available rings */
>  	igt_describe("amdgpu secure bounce");
>  	igt_subtest("amdgpu-secure-bounce")
> -	amdgpu_secure_bounce(device, fd, &sdma_info, get_ip_block(device,
> -			AMDGPU_HW_IP_DMA), is_secure);
> +	{
> +		igt_skip_on_f(is_apu(&gpu_info) == 1,
> +				"Secure bounce test is not supported in APU's.\n");
> +		amdgpu_secure_bounce(device, fd, &sdma_info, get_ip_block(device,
> +				AMDGPU_HW_IP_DMA), is_secure);
> +	}
>  
>  #ifdef AMDGPU_USERQ_ENABLED
>  	igt_describe("amdgpu gfx command submission write linear helper with user queue");
> -- 
> 2.53.0
> 
