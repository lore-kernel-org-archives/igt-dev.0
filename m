Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AECEC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 09:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C8910E63D;
	Wed, 29 May 2024 09:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LVUuVFVn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510EB10E63D
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716975534; x=1748511534;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n2NcesWmauflVtH0a3pMtNYdRrjY0y/YHYk5aIQNm5k=;
 b=LVUuVFVn+BSg1lUQ9bJe8nDVft7NPeyAbCbt/5xdfDQ8aQfo3V9gkFNf
 LA2tb+KVB8NjA9Wnig0WSbI2T8C47z7Vz9UkUmo/HOOqUSreCJVij5HBa
 YXM+qlpnQm+LUAxkF/p4dxmyu5VoeBVsmJOsHtkP0cPxhLSJOov0f5JuH
 2XPgxcD6fO8JO0Zczp/EowHFapqfNCWMuQnLo3XOOhLPxu/L/jDhN8Vi9
 YVu8WZz5wpEEDa5bdrsUHW7XcQeV/0+nRmSw26ZdX+DpSMpZGHJi4yni4
 POqj/BGUxzNT9r0TezL+PzzPnROBkt5fSew69iCM5pMpnhyVfKCr+Dvw5 A==;
X-CSE-ConnectionGUID: mOZnVpRwTBemA7cmHhazTg==
X-CSE-MsgGUID: tTxbYvFsSo+1cIz9x8KTog==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16316801"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="16316801"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 02:38:54 -0700
X-CSE-ConnectionGUID: 8MCfihi9RyuwSRYR6R9OpQ==
X-CSE-MsgGUID: blqKS4knTxOYWTsgc2j7eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="40273875"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 02:38:52 -0700
Date: Wed, 29 May 2024 11:38:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v5 1/5] lib/gpu_cmds: add Xe_LP version of emit_vfe_state
Message-ID: <20240529093849.e7hs6mkpjt4ijuni@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240528-iga64_inline_ups-v5-0-fdd8e9dcd64c@intel.com>
 <20240528-iga64_inline_ups-v5-1-fdd8e9dcd64c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240528-iga64_inline_ups-v5-1-fdd8e9dcd64c@intel.com>
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

Hi Andrzej,
On 2024-05-28 at 16:04:47 +0200, Andrzej Hajda wrote:
> In Xe_LP version there is added argument to control EU thread
> dispatching mode. For shaders lagacy mode is used.
> 
> v2: added commit description
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/gpu_cmds.c | 29 +++++++++++++++++++++++------
>  lib/gpu_cmds.h |  6 ++++++
>  2 files changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 378fa9166ab8..6caaeb01be29 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -651,10 +651,10 @@ gen7_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
>  	intel_bb_out(ibb, 0);
>  }
>  

Please add documentation to each new/changed public function.
Imho you can keep r-b.

Regards,
Kamil

> -void
> -gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
> -		    uint32_t urb_entries, uint32_t urb_size,
> -		    uint32_t curbe_size)
> +static void
> +__gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
> +		      uint32_t urb_entries, uint32_t urb_size,
> +		      uint32_t curbe_size, bool legacy_mode)
>  {
>  	intel_bb_out(ibb, GEN7_MEDIA_VFE_STATE | (9 - 2));
>  
> @@ -662,8 +662,8 @@ gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
>  	intel_bb_out(ibb, 0);
>  	intel_bb_out(ibb, 0);
>  
> -	/* number of threads & urb entries */
> -	intel_bb_out(ibb, threads << 16 | urb_entries << 8);
> +	/* number of threads & urb entries & eu fusion */
> +	intel_bb_out(ibb, threads << 16 | urb_entries << 8 | legacy_mode << 6);
>  
>  	intel_bb_out(ibb, 0);
>  
> @@ -676,6 +676,15 @@ gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
>  	intel_bb_out(ibb, 0);
>  }
>  
> +void
> +gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
> +		    uint32_t urb_entries, uint32_t urb_size,
> +		    uint32_t curbe_size)
> +{
> +	__gen8_emit_vfe_state(ibb, threads, urb_entries, urb_size, curbe_size,
> +			      false);
> +}
> +
>  void
>  gen7_emit_curbe_load(struct intel_bb *ibb, uint32_t curbe_buffer)
>  {
> @@ -864,6 +873,14 @@ gen7_emit_media_objects(struct intel_bb *ibb,
>  			gen_emit_media_object(ibb, x + i * 16, y + j * 16);
>  }
>  
> +void xelp_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
> +			 uint32_t urb_entries, uint32_t urb_size,
> +			 uint32_t curbe_size, bool legacy_mode)
> +{
> +	return __gen8_emit_vfe_state(ibb, threads, urb_entries, urb_size,
> +				     curbe_size, legacy_mode);
> +}
> +
>  /*
>   * XEHP
>   */
> diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> index 348c6c9453e9..1b9156a80c7c 100644
> --- a/lib/gpu_cmds.h
> +++ b/lib/gpu_cmds.h
> @@ -81,6 +81,12 @@ void
>  gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
>  		    uint32_t urb_entries, uint32_t urb_size,
>  		    uint32_t curbe_size);
> +
> +void
> +xelp_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
> +		    uint32_t urb_entries, uint32_t urb_size,
> +		    uint32_t curbe_size, bool legacy_mode);
> +
>  void
>  gen7_emit_curbe_load(struct intel_bb *ibb, uint32_t curbe_buffer);
>  
> 
> -- 
> 2.34.1
> 
