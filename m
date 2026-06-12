Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E182CCD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 14:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CE010F53B;
	Fri, 12 Jun 2026 14:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pknuic86";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2A210F53B
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781273634; x=1812809634;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5oY4lvS03E7BzeeZP3M9i1gvBNYeSsYCbCnra4r3Kz4=;
 b=Pknuic861LQ4yYw/CIMyxWFA9/R5fgEHT85gWhf2jkwWxIoCcEFQlZ5K
 47SRO39kzVaHUyEB7fxtXejw4uqIbNIc4H0KVjX74xwtanaWU5d7UAB3O
 6iPQBoixe4Jy93xOGQi6xH0/eg77+qVT5I8+mdU1G2ukzFzImWONeGU8w
 7mONzRMQUBxM3u4BiOhGX17EPPFtQeWmmqQYzthT9T75FyRckGATDrgoa
 Zqezgzg+BncpzDfcw0zSSEna9HjnELMrI1Dy9gDUGTxtqAiZ2hFo1tgMZ
 xXntP9kUeBVMbLhCMtYiY+2EsiIt5yjn+Lpl2+3Mj1imExwo8KltrjJC4 g==;
X-CSE-ConnectionGUID: +ViZW79UQrqn2Zv8GaDz3g==
X-CSE-MsgGUID: tZh3ITggQ6q5d02jQWOFKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82147938"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="82147938"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 07:13:54 -0700
X-CSE-ConnectionGUID: VHy+ubmIRB2hrj6Ec7hx/w==
X-CSE-MsgGUID: 88CAn4zgStmECN3LWNFV/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="242453324"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 07:13:53 -0700
Date: Fri, 12 Jun 2026 16:13:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 3/4] tools/vbt_decode: return 0 from get_device_id()
Message-ID: <20260612141336.sbb2u4pdn2j7pixu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 ville.syrjala@linux.intel.com
References: <cover.1781261899.git.jani.nikula@intel.com>
 <5f020e16d2604d820341ff2c476cca1dda3d9655.1781261899.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f020e16d2604d820341ff2c476cca1dda3d9655.1781261899.git.jani.nikula@intel.com>
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

Hi Jani,
On 2026-06-12 at 14:00:43 +0300, Jani Nikula wrote:
> From: Michał Grzelak <michal.grzelak@intel.com>
> 
> This function returns -1 on errors and the caller checks for 0. This
> leads to -1 being used as the device id. Return 0 instead of -1.
> 
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tools/intel_vbt_decode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 5b39e0c1c33e..69961ce29e01 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -3702,13 +3702,13 @@ get_device_id(unsigned char *bios, int size)
>      int offset = (bios[0x19] << 8) + bios[0x18];

btw do we need a function for this?
like bios_u32(bios, offset) or lowend_u32(p, off)

Regards,
Kamil

>  
>      if (offset + 7 >= size)
> -	return -1;
> +	return 0;
>  
>      if (bios[offset] != 'P' ||
>  	bios[offset+1] != 'C' ||
>  	bios[offset+2] != 'I' ||
>  	bios[offset+3] != 'R')
> -	return -1;
> +	return 0;
>  
>      device = (bios[offset+7] << 8) + bios[offset+6];
>  
> -- 
> 2.47.3
> 
