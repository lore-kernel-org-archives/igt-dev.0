Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F145C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 12:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4437C10E76D;
	Wed, 30 Apr 2025 12:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acLjak84";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3571010E76D
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 12:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746017329; x=1777553329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1tKltEec8d8Zs+wFZ682dKrmt5sPXVDOzc26Xr4n7XU=;
 b=acLjak846Q0H1I0h7v+09BgDAL/Q2jEdu+GShKehAeIt53GMHDk4vjMm
 228wZB2OB2QDviKD96PCD70ddbpeYaBo535xxgQ3qEUeI8jsm8jFBNzZg
 KOG4PTnyecgZ/dzrjI1ddov9iHya/gsra7LTBFjk4xxEpn3a/1flhEC1J
 xBA/LCsmDJbDUmJn4M+9cVGToLfq8yb6VG8anvVamjuhG4OOGq4KQeQo9
 upTciFq1BywmwwunDEVPTHFahl/aNy1Fh30GrFnCGenCRnDqPukLqSREv
 F4eUT+3x+vwvLtds8a82AcqMXQbZRE3fcivhGNrWq/m7llxiZWdvK6y1/ g==;
X-CSE-ConnectionGUID: QsWM9pcDTZmczm6Gn5z/DA==
X-CSE-MsgGUID: q32SV5VNTXyXq4p0En/VKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58307685"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="58307685"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 05:48:49 -0700
X-CSE-ConnectionGUID: qyddwSrWRU+w7phN+ec88Q==
X-CSE-MsgGUID: PZwxaXbcSK2E91FQp24Y/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134004928"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 05:48:47 -0700
Date: Wed, 30 Apr 2025 14:48:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Tomita Moeko <tomitamoeko@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tools/intel_gtt: add support for gen10+ devices
Message-ID: <20250430124845.xcwilmv46unyifb7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tomita Moeko <tomitamoeko@gmail.com>, igt-dev@lists.freedesktop.org
References: <20250424074135.171022-1-tomitamoeko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424074135.171022-1-tomitamoeko@gmail.com>
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

Hi Tomita,
On 2025-04-24 at 15:41:35 +0800, Tomita Moeko wrote:
> Gen10 and later devices all have the same 64 bit GGTT entries as gen8.
> Additionally, devices from Meator Lake onwards have bits 45:12 for
> physical address [1].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=341ad0e8e254267704e0b87e35ad23aba5c02359
> 

I will add Closes: 'gitlab issue' here

> Signed-off-by: Tomita Moeko <tomitamoeko@gmail.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_gtt.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/intel_gtt.c b/tools/intel_gtt.c
> index c0f3d16a6..658336d99 100644
> --- a/tools/intel_gtt.c
> +++ b/tools/intel_gtt.c
> @@ -86,7 +86,14 @@ static uint64_t get_phys(uint32_t pt_offset)
>  			break;
>  		case 8:
>  		case 9:
> -			phys = phys & 0x7ffffff000;
> +		case 10:
> +		case 11:
> +		case 12:
> +		case 20:
> +			if (intel_graphics_ver(devid) >= IP_VER(12, 70))
> +				phys = phys & 0x3ffffffff000;
> +			else
> +				phys = phys & 0x7ffffff000;
>  			break;
>  		default:
>  			fprintf(stderr, "Unsupported platform\n");
> -- 
> 2.47.2
> 
