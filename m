Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D45CDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 09:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C5610E591;
	Mon, 22 Jun 2026 09:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nl7LHXTz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFED10E591
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782119625; x=1813655625;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UDl0rd+WPMP4iYCY9WRY8uBSHj0gQTAizMcgQst0ECc=;
 b=Nl7LHXTza9WD+m61NGD1pPE8sEJyDiX+CUNEo24WxiFl9u2UcvpYR8Mf
 JYY4c8N7/Mywn1LcIdxPN8rFNmRKS+Pj+Rpi0C0FtWhWPMzFK3a8uYLd2
 g8vIS3q0cBaVEtjdeB6hts3YiL5zaeUCb9MXegZzmOJ8Ttl0c0qQmTYBE
 PnpAShy9MqUXOZo1HScVaAsNRGHPlmucwIshUGreaCwrpQTuLaECUWOcB
 LNxyySseRJASg2ete03NQMIMHpMdMvzRIng0mBZgracCJ83/Md3S0NzdF
 dPiFjyq/JfD9wqOslPiAs/SlVdgds9PX+iZ82g/CO6cVJCQZlNBy7aXow Q==;
X-CSE-ConnectionGUID: zDxpat3ySd6cpTCD8zt7fA==
X-CSE-MsgGUID: qsio+wwSRcaw3m9SG6cwWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82847544"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82847544"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 02:13:45 -0700
X-CSE-ConnectionGUID: yWOy7xSsTg2V7VMiJZH9og==
X-CSE-MsgGUID: onBAGR+DRJWH9SDNlX1WIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="248032101"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 02:13:44 -0700
Date: Mon, 22 Jun 2026 11:13:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Ramalingeswara Reddy, Kanala" <Kanala.RamalingeswaraReddy@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly.Prosyak@amd.com,
 Christian.Koenig@amd.com, Pratik.Vishwakarma@amd.com
Subject: Re: [PATCH] tests/amdgpu/amd_security: Skip secure bounce test for
 APUs
Message-ID: <20260622091325.wshkp4ugkqejz6la@kamilkon-DESK.igk.intel.com>
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

Hi Ramalingeswara,
On 2026-06-22 at 09:34:18 +0530, Ramalingeswara Reddy, Kanala wrote:
> Secure bounce test is not supported for APUs.
> 
> On dGPUs, TMZ works only on VRAM (local memory) but not on
> GTT (system memory) due to HW limitations, so this test validates bounce
> operation from VRAM to GTT and back to VRAM works on dGPUs.
> 
> Since APUs do not support this functionality, skip the test for APUs.
> 
> Signed-off-by: Ramalingeswara Reddy, Kanala <Kanala.RamalingeswaraReddy@amd.com>

Please fix your s-o-b, specifically remove comma and reorder
your name, imho it should be:

Signed-off-by: Kanala Ramalingeswara Reddy <Kanala.RamalingeswaraReddy@amd.com>

Note: edit your global git config. Also change your e-mail config
so your From: address will match your s-o-b.

Regards,
Kamil

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
