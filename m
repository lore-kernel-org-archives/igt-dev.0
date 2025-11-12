Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A733DCCF9F8
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 09:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547C010E03A;
	Wed, 12 Nov 2025 09:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKD/vpSz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958F710E03A
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 09:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762938492; x=1794474492;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Hi5Hhoi5likG6XPvWnfp124/5CJUuWQQGJ8Xs85DkTw=;
 b=DKD/vpSzp7L8FbkLHt4rpx2ByzGOLD59yucozzuM3F/xuOG/oiIsUGfg
 kC8iVVrbcC2ub+kLMGMUAf8ZwioixGmAEnY3z3n8lsNCt0iWMtN7mw/OE
 I/rjO/ar3Itwu3IIbl+xcIiIJG9v1tPWnsNPUmgUgYr4mgYBWz0SIHhv7
 qgQ1hFLZGmxZlobuBCMd4VYWBKwt6nz7xThGA07hRAVswDMiNzyP+NhDL
 WkTdv4ITOOHTDByY5h7v08NYV40HCr42pecRhBfE8ylxWcPRJGlLCu1BF
 4sVhRVdJF8gYK4KKnqq/8D69sXnIptmKwRgmJpoB9xDv0WHSgD0xEidSM w==;
X-CSE-ConnectionGUID: e5hV8DUBTLemKjq2YOHkIA==
X-CSE-MsgGUID: tmWILH95RtS5GO43344kiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75303047"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75303047"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 01:08:11 -0800
X-CSE-ConnectionGUID: g1qBPS2oT/yXnHJBeAO0fg==
X-CSE-MsgGUID: i0pF3oKsQYuLSp09Fl941w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188424663"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.194])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 01:08:10 -0800
Date: Wed, 12 Nov 2025 10:08:07 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v2 1/2] lib/intel_blt: BB index should be incremented in
 dwords
Message-ID: <jzcbmorwwgtt34ptfimrnfuocxkz3kgom2w2q7p47gqznstnpr@mbufhtfctnif>
References: <20251111153014.3681794-3-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111153014.3681794-3-balasubramani.vivekanandan@intel.com>
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

On Tue, Nov 11, 2025 at 09:00:15PM +0530, Balasubramani Vivekanandan wrote:
> Size in bytes in used to increment the BB index, which is incorrect.
> Convert bytes to number of dwords.
> Also while checking for remaining size available in a BB, the index
> should be multiplied by the dword size.
> 
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  lib/intel_blt.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 7f7f5485e..fd7b29ccd 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1629,6 +1629,11 @@ static void dump_bb_fast_cmd(struct gen12_fast_copy_data *data)
>  		 cmd[9], data->dw09.src_address_hi);
>  }
>  
> +static inline uint64_t bb_remaining_size(const struct blt_copy_batch *bb,
> +					 uint64_t bb_pos) {
> +	return bb->size - bb_pos * sizeof(uint32_t);
> +}
> +
>  /**
>   * emit_blt_fast_copy:
>   * @fd: drm fd
> @@ -1712,14 +1717,14 @@ uint64_t emit_blt_fast_copy(int fd,
>  
>  	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
>  
> -	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
> +	igt_assert(bb_remaining_size(&blt->bb, bb_pos) >= sizeof(data));
>  	memcpy(bb + bb_pos, &data, sizeof(data));
> -	bb_pos += sizeof(data);
> +	bb_pos += DIV_ROUND_UP(sizeof(data), sizeof(*bb));

There're more places in which we need to fix the same issue. My comment
from your previous series applies here as well. uint32_t *bb -> uint8_t *
should do the job.

--
Zbigniew

>  
>  	if (emit_bbe) {
> -		igt_assert(bb_pos + sizeof(uint32_t) < blt->bb.size);
> +		igt_assert(bb_remaining_size(&blt->bb, bb_pos) >= sizeof(bbe));
>  		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
> -		bb_pos += sizeof(uint32_t);
> +		bb_pos += DIV_ROUND_UP(sizeof(bbe), sizeof(*bb));
>  	}
>  
>  	if (blt->print_bb) {
> -- 
> 2.43.0
> 
