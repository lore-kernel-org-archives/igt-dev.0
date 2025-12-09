Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9ADD3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 13:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C0410E59D;
	Tue,  9 Dec 2025 13:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jxtzu74J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE6510E59D
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765287325; x=1796823325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VoV1HFseOCyeKHsXEH4BVIvVJXiDoIE2/4tBvCzeJy8=;
 b=Jxtzu74JWFnYEjy15YgwrudzKpHCAv7ivXnD48S8f4SPZTG+3fSDP7f7
 QZLYlZ0Q46xG95+Sj2faM5v8fuSZeT3ifYZvPoeWMU7LpEPp+qlfPhTaE
 fanSfVNl50NbtKG7lbZkMEIkOwj21/9+pBPNDwhkXUuu5Q9E8mFa5bpKS
 biQVywRNSRnZdTV1q2d1z1zYRHPt9QcBormvSCe/M1jN1oFMu3RDRKAhZ
 OEFdcfljYeA1KgTV9o5wABJewLr4tNF7YsKnaO5Nfe3akMu9xmwe5ufKz
 pTobCc5zHZkiPhG/uMaIZ2aZJ82Zy1scYgDtgO2lUNji+9k/vscee8MKu A==;
X-CSE-ConnectionGUID: J1bY2vdtQNeEIdwn7kvZVw==
X-CSE-MsgGUID: HfnoyWGBS1iNFakLcaet6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67135495"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="67135495"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 05:35:25 -0800
X-CSE-ConnectionGUID: h9J3Iz/8RtWiW2n/ctBKQA==
X-CSE-MsgGUID: +R1hKATiR/aIfsvZFWMx7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="196683705"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 05:35:24 -0800
Date: Tue, 9 Dec 2025 14:35:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH i-g-t 2/3] tests/intel/kms_frontbuffer_tracking: Add HDR
 feature support
Message-ID: <20251209133522.pwc6djxzvwefu2uf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, chaitanya.kumar.borah@intel.com
References: <20251203090836.1164827-1-swati2.sharma@intel.com>
 <20251203090836.1164827-3-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251203090836.1164827-3-swati2.sharma@intel.com>
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

Hi Swati,
On 2025-12-03 at 14:38:35 +0530, Swati Sharma wrote:
> Add FEATURE_HDR and extend feature_str() to cover all feature mask
> combinations.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 35 ++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 0f162d9a5..eda97f7df 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -855,8 +855,9 @@ struct test_mode {
>  		FEATURE_FBC   = 1,
>  		FEATURE_PSR   = 2,
>  		FEATURE_DRRS  = 4,
> -		FEATURE_COUNT = 8,
> -		FEATURE_DEFAULT = 8,
> +		FEATURE_HDR   = 8,
> +		FEATURE_COUNT = 16,
> +		FEATURE_DEFAULT = 16,
>  	} feature;
>  
>  	/* Possible pixel formats. We just use FORMAT_DEFAULT for most tests and
> @@ -3987,12 +3988,36 @@ static const char *feature_str(int feature)
>  		return "fbc";
>  	case FEATURE_PSR:
>  		return "psr";
> -	case FEATURE_FBC | FEATURE_PSR:
> -		return "fbcpsr";
>  	case FEATURE_DRRS:
>  		return "drrs";
> +	case FEATURE_HDR:
> +		return "hdr";
> +	case FEATURE_FBC | FEATURE_PSR:
> +		return "fbcpsr";

Can it be splitted by '-'? imho better: "fbc-psr".
Same comment to all or-ed strings below.

Regards,
Kamil

>  	case FEATURE_FBC | FEATURE_DRRS:
> -		return "fbcdrrs";
> +	        return "fbcdrrs";
> +	case FEATURE_FBC | FEATURE_HDR:
> +	        return "fbchdr";
> +
> +	case FEATURE_PSR | FEATURE_DRRS:
> +		return "psrdrrs";
> +	case FEATURE_PSR | FEATURE_HDR:
> +	        return "hdrpsr";
> +	case FEATURE_DRRS | FEATURE_HDR:
> +	        return "hdrdrrs";
> +
> +	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS:
> +		return "fbcpsrdrrs";
> +	case FEATURE_FBC | FEATURE_PSR | FEATURE_HDR:
> +		return "hdrfbcpsr";
> +	case FEATURE_FBC | FEATURE_DRRS | FEATURE_HDR:
> +		return "hdrfbcdrrs";
> +	case FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
> +		return "hdrpsrdrrs";
> +
> +	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
> +		return "hdrfbcpsrdrrs";
> +
>  	default:
>  		igt_assert(false);
>  	}
> -- 
> 2.25.1
> 
