Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606ACC0218F
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 06:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D71110E252;
	Tue,  4 Feb 2025 06:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fRbGiwKy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368CD10E252
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 06:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738652152; x=1770188152;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=emUcihQJAsyyiYnNXN9TVmrkqzSM/i1KmzeIs8pYsLU=;
 b=fRbGiwKyx+QsN5uqsENkQelPOiHt0Wd9SLO0K7fdtGJKLr6FYac3iwgQ
 YDc6lfMTP76IHoT8jevJ6L5j9WyEdy2y7Bypc0UUl//nQ6yF3r2VuG6bo
 sZgF6mZPXNZ8uo+4fnnAakM3ajBnZlJG8kZmzqgkEe7JD4IH+ZSKsP9Km
 Qe+Mp7HjRxIB1M4bimSAm8sRMRq5FIiOZq4kIEyeWHBgUInWjxsZGWPV2
 MXu+GPcxlIyaibJY6VLz8xDay4rS5Pl66X1O3o0gx6auvM/ECQ0aXB9Qq
 9N8DFGNDFOvnogPBOjj4x4XiIa815N9a3hD7P11NNKJMJWseSRvb/J0WH A==;
X-CSE-ConnectionGUID: FAfwl+uWT/qR+5TxHDUhnQ==
X-CSE-MsgGUID: ksYxxrHTSEyWhp1PlkWovw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="61638065"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="61638065"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 22:55:52 -0800
X-CSE-ConnectionGUID: 4/i243VeQJ+QQ2bk9+saRw==
X-CSE-MsgGUID: I+qM5xWdSMGjmlJ5o4XucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115504641"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.111])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 22:55:50 -0800
Date: Tue, 4 Feb 2025 07:55:47 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] lib/intel_compute: Align objects on 64K for
 xehpc
Message-ID: <20250204065547.tw52jo62gficlbmz@zkempczy-mobl2>
References: <20250203133916.843931-1-francois.dugast@intel.com>
 <20250203133916.843931-3-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203133916.843931-3-francois.dugast@intel.com>
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

On Mon, Feb 03, 2025 at 02:38:47PM +0100, Francois Dugast wrote:
> Some of the buffers are aligned on 4K. Ensure 64K alignment
> in preparation for a switch to using xe_bo_create() during
> buffers creation.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 983b2e2c3..0e1179b62 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1125,7 +1125,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_create(fd, &execenv, eci);
>  
>  	/* Sets Kernel size */
> -	bo_dict[0].size = ALIGN(size, 0x1000);
> +	bo_dict[0].size = ALIGN(size, 0x10000);

You may align to xe_get_default_alignment() I think. Same in 1/3
patch but I've noticed it now. With this nit:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  
>  	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
>  
> -- 
> 2.43.0
> 
