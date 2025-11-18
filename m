Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15CECEBF92
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 08:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E79A10E13A;
	Tue, 18 Nov 2025 08:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mvdPrzYi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57D110E13A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 08:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763455060; x=1794991060;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OHZRoWX/myZsTMNE+BxkDXDBtnps18kB/ZTsyrcDMos=;
 b=mvdPrzYiEaDBWg7cCzEIwtUGR1QCsBl/J1uaxrrBbg0e80c3ArUCyVJL
 dl5YKMP+zdQPiCquSI7Wd3efVgdcHcNZdsCukfThaLtaGGVD4vhP5yPlz
 FjxuW+qukeMB0JQ84xb8QF6hJDk0OFfBSzMY19gLnP0YmX+UT0s5zd95a
 LztC6G5C2oYE/pTAIeTCAySJQgsIOA2wWSTlzBaFx9ODm5aPxUE1EhBSG
 drD1d2HckWs77EgWPBhH9DlMuOroS67db0umXGajhiuiaa56pbRSIii1/
 8rztqYDE1EHxzb66DQj9hFfNyc9uD9oUrrJGRLJdvOPEsw574u5bPXRTV A==;
X-CSE-ConnectionGUID: qpy7ndGFTy2RsyoaVuGrTw==
X-CSE-MsgGUID: 6ZvABPTpQG6+c8egUD813A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="64470423"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="64470423"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:37:39 -0800
X-CSE-ConnectionGUID: mKVrMFvYQOKdQMQuLeGBog==
X-CSE-MsgGUID: 0BPLjYzYRKKNudrgrmBNoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190363386"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.69])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:37:38 -0800
Date: Tue, 18 Nov 2025 09:37:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v4 1/2] lib/intel_blt: Convert BB pointer to uint8_t* in
 emit_blt_fast_copy
Message-ID: <c7nchvya7gdlpwglx2lgn6bmsbqj7l4v7oi6eizqll5q7r75z4@avio7jli5tlz>
References: <20251117101836.3892456-3-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117101836.3892456-3-balasubramani.vivekanandan@intel.com>
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

On Mon, Nov 17, 2025 at 03:48:37PM +0530, Balasubramani Vivekanandan wrote:
> Argument bb_pos is a byte offset. So the BB pointer should be defined as
> uint8_t*. Fix it by changing the BB pointer from uint32_t* to uint8_t*.
> 
> Additional minor fix to change use of sizeof(uint32_t) to sizeof(bbe)
> while checking for size of BBE instruction.

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
> 
> v2:
>   - Same fix done at few places in the function (Ashutosh)
> v3:
>   - Convert bb pointer from uint32_t* to uint8_t* (Ashutosh, Zbigniew)
> v4:
>   - Return bb byte offset from emit_blt_fast_copy (Zbigniew)
> 
> ---
>  lib/intel_blt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 7f7f5485e..e63341a02 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1655,7 +1655,7 @@ uint64_t emit_blt_fast_copy(int fd,
>  	struct gen12_fast_copy_data data = {};
>  	uint64_t dst_offset, src_offset, bb_offset;
>  	uint32_t bbe = MI_BATCH_BUFFER_END;
> -	uint32_t *bb;
> +	uint8_t *bb;
>  
>  	data.dw00.client = 0x2;
>  	data.dw00.opcode = 0x42;
> @@ -1717,9 +1717,9 @@ uint64_t emit_blt_fast_copy(int fd,
>  	bb_pos += sizeof(data);
>  
>  	if (emit_bbe) {
> -		igt_assert(bb_pos + sizeof(uint32_t) < blt->bb.size);
> +		igt_assert(bb_pos + sizeof(bbe) < blt->bb.size);
>  		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
> -		bb_pos += sizeof(uint32_t);
> +		bb_pos += sizeof(bbe);
>  	}
>  
>  	if (blt->print_bb) {
> -- 
> 2.43.0
> 
