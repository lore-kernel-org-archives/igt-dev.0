Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2170BCF6D3B
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 15:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6595F10E03C;
	Wed,  2 Oct 2024 15:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMZLfGk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECCA10E03C
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727883913; x=1759419913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Do52Df8sAkikLmwEYTJaCgs79RbAmFyzked+WUdwUqQ=;
 b=ZMZLfGk13iFayFFqV0xUjHR/qvtFe0Zi9aMlhSrzaBgY4RZPJ35PI9TS
 /x8KtrTeko1LZt/Ui3pJsqTyrvZf5HDxNtk1d5KCAyt2glZa/stOIALJF
 FopqxGxPldktYymdnotyD70dVgA+2x4uWxYZA/sZG3D/uHVCRbNxb7JL5
 B/2R2UjNqbeJ1Mypg/fi3Xlz2dbIWFMgZjflJxIT5HsliLFyDqZ1al9sF
 /pFRvrVVCfkSUUcCvNsl/op8BCKn2PORofZz75JW7Vv6njcDMUpCt4X/u
 4MQINNqSbiKESkIyW7k4IINoq33BH86pR28ye7soInCDi0breXUKfaPrs g==;
X-CSE-ConnectionGUID: /kV1j6ZaRsSL6AlZ/WL8yw==
X-CSE-MsgGUID: qa5/1rfcRSqMW8x4FG1w+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26853117"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="26853117"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 08:45:13 -0700
X-CSE-ConnectionGUID: WalBVtzJTVWeLWZSnSuG8g==
X-CSE-MsgGUID: fzEfPkMeT1iWNPznu9SQiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="73911783"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 08:45:12 -0700
Date: Wed, 2 Oct 2024 17:45:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 3/3] lib/intel_compute: Fix compiler warnings on
 x86-32
Message-ID: <20241002154508.nozgs4ysclyfukk7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20240927163307.10159-1-ville.syrjala@linux.intel.com>
 <20240927163307.10159-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240927163307.10159-3-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-09-27 at 19:33:07 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> x86-32 gcc is not happy:
> ../lib/intel_compute.c: In function ‘xehp_compute_exec_compute’:
> ../lib/intel_compute.c:862:48: warning: right shift count >= width of type [-Wshift-count-overflow]
>   862 |         addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
>       |                                                ^~
> 
> Just use ULL for all the address constants.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  lib/intel_compute.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 1cc39f645c2e..3ab9ace7932c 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -27,20 +27,20 @@
>  #define SIZE_BATCH			0x1000
>  #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
>  #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
> -#define ADDR_BATCH			0x100000UL
> -#define ADDR_INPUT			0x200000UL
> -#define ADDR_OUTPUT			0x300000UL
> -#define ADDR_SURFACE_STATE_BASE		0x400000UL
> -#define ADDR_DYNAMIC_STATE_BASE		0x500000UL
> +#define ADDR_BATCH			0x100000ULL
> +#define ADDR_INPUT			0x200000ULL
> +#define ADDR_OUTPUT			0x300000ULL
> +#define ADDR_SURFACE_STATE_BASE		0x400000ULL
> +#define ADDR_DYNAMIC_STATE_BASE		0x500000ULL
>  #define ADDR_INDIRECT_OBJECT_BASE	0x100000000
>  #define OFFSET_INDIRECT_DATA_START	0xFFFD0000
>  #define OFFSET_KERNEL			0xFFFE0000
>  
> -#define ADDR_GENERAL_STATE_BASE		0x80000000UL
> -#define ADDR_INSTRUCTION_STATE_BASE	0x90000000UL
> +#define ADDR_GENERAL_STATE_BASE		0x80000000ULL
> +#define ADDR_INSTRUCTION_STATE_BASE	0x90000000ULL
>  #define OFFSET_BINDING_TABLE		0x1000
>  
> -#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000UL
> +#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
>  #define OFFSET_STATE_SIP			0xFFFF0000
>  
>  /*
> -- 
> 2.45.2
> 
