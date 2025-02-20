Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A24C021B1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 08:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B70510E181;
	Thu, 20 Feb 2025 08:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lKSeGRWr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8DB10E181
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 08:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740038740; x=1771574740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dYunqAst5u+tudoq4KfhnuhXOnGKpfp2YuERb6sIa4A=;
 b=lKSeGRWrncU0KOwYmlkDBLdvE/rCWKIiODXIPhnzmI1MEGuxD5m7Eauy
 qr1Q7gBYS3qBggzuL/Y4+wjaMV851xp5JwOEZT6g7YngXVRbm/COd7SsA
 Z50wU4s8H3jeD9pPepJJg+s4PmyMGhyBptrMvapBXkpj9JzXX+kanxNxu
 /PnubOOK1QLsYXtD+Nh2wsD5VJEVutRbkJhtXNnZNQdwCMTyWdb6qHMy/
 nLr9fPBC5ye3WjPqe03AIYXJLvL6GK5ihzZzY/QIuz5jUKgTYVgCtPIfF
 NGelv6Q7bVju9+GhPlTMr1LajySFG/20pB1dZWaTX6uZBRoesNgcCr1KD A==;
X-CSE-ConnectionGUID: kdT0Q7tlTrqfWP2NfvUVCQ==
X-CSE-MsgGUID: eZWjOrrpQx+cuSuIe6NvLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40036435"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40036435"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 00:05:40 -0800
X-CSE-ConnectionGUID: WRpnKypqT3iph4KQX8K+xg==
X-CSE-MsgGUID: DRQ9Q8DsRZm0iRoNfZ/48A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="114950642"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 00:05:35 -0800
Date: Thu, 20 Feb 2025 09:05:31 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/5] lib/intel_compute: Add ptl library support for
 wmtp test
Message-ID: <20250220080531.yte2hzciamoxnmuc@zkempczy-mobl2>
References: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
 <20250217081854.3219791-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217081854.3219791-2-priyanka.dandamudi@intel.com>
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

On Mon, Feb 17, 2025 at 08:18:50AM +0000, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Enable WMTP test for PTL.
> 
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/intel_compute.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index bca763328..f46de1074 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2049,6 +2049,11 @@ static const struct {
>  		.compute_exec = xe2lpg_compute_preempt_exec,
>  		.compat = COMPAT_DRIVER_XE,
>  	},
> +	{
> +		.ip_ver = IP_VER(30, 00),
> +		.compute_exec = xe2lpg_compute_preempt_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
>  };
>  
>  static bool __run_intel_compute_kernel_preempt(int fd,
> -- 
> 2.34.1
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
