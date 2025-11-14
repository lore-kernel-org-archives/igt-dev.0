Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCADCE7A8E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 09:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A404210EA1E;
	Fri, 14 Nov 2025 09:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="df7Gg/Ug";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0EE10EA1D
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763112015; x=1794648015;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5mCNRrsUFjjrkuDDhqGHPtyFn1/B2RWMqGY+ypF4SaE=;
 b=df7Gg/UgSHGSIZR+QXMV8j3m8qCKxHJT80//6CMVNCBjiHC4PKd67TMU
 V2zUexhugz3rTEx4DjJgRu71UZXYVd86P5QJdONoeYtXi8lZxSYIt2R8K
 OQJdixT1LnI0ZUTLuGh0I4+Wg0/E9a4S+35wF4+WvirmWVv/DYwteSJm3
 f8KTVxjgQhWY4Gqxw2H/fEoKzEK8theB/WKiXkS8umw3tiJNZ2ncuR1CZ
 PSfLvffCWFkyLQ5Wqc9kT8Ezq/9+UJ4qYyZnZud8CHOYybjvSa9pMRFSR
 p7OHV05kXmctErm6JGFL9YqNFCpMgcJdXVYFV8huzHeNCubNx3aNGE0n5 Q==;
X-CSE-ConnectionGUID: FDQMuz/fRPq44bUgYB3EeA==
X-CSE-MsgGUID: FCujxWrmQC+wvXyp8fFCBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90682491"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="90682491"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 01:20:15 -0800
X-CSE-ConnectionGUID: qiwDaYkWS/uRnweRtdWClA==
X-CSE-MsgGUID: KDlPo1dFQGmux71WYWucnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="194720979"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 01:20:13 -0800
Date: Fri, 14 Nov 2025 10:20:12 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v3 1/2] lib/intel_blt: Fix adding byte offset to bb_pos
Message-ID: <sifsqd42ewkyymipf6icahpcjkx5bzneyclhc3tba5do3hxtfv@3jjmxh26sjvz>
References: <20251113141027.3803274-3-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113141027.3803274-3-balasubramani.vivekanandan@intel.com>
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

On Thu, Nov 13, 2025 at 07:40:28PM +0530, Balasubramani Vivekanandan wrote:
> Argument bb_pos is dword offset but it is incremented using byte offset.
> Fix it by converting the bb_pos to byte offset and use it for indexing
> the BB pointer.
> Convert back to dword offset before returning the offset.
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
> 
> ---
>  lib/intel_blt.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 7f7f5485e..b4daf4b8e 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1655,7 +1655,8 @@ uint64_t emit_blt_fast_copy(int fd,
>  	struct gen12_fast_copy_data data = {};
>  	uint64_t dst_offset, src_offset, bb_offset;
>  	uint32_t bbe = MI_BATCH_BUFFER_END;
> -	uint32_t *bb;
> +	uint8_t *bb;
> +	uint64_t offset = bb_pos * sizeof(uint32_t);

This makes all of the library related to emit inconsistent. Fast copy
emit would start to return dword index whereas rest of the library
returns byte offsets. I think changing bb type to uint8_t * is enough to
fix the issue. Here we use mostly structs describing commands (not
directly dword emitting) and using direct memory location /
sizeof(struct) makes more sense to me.

--
Zbigniew
>  
>  	data.dw00.client = 0x2;
>  	data.dw00.opcode = 0x42;
> @@ -1712,14 +1713,14 @@ uint64_t emit_blt_fast_copy(int fd,
>  
>  	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
>  
> -	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
> -	memcpy(bb + bb_pos, &data, sizeof(data));
> -	bb_pos += sizeof(data);
> +	igt_assert(offset + sizeof(data) < blt->bb.size);
> +	memcpy(bb + offset, &data, sizeof(data));
> +	offset += sizeof(data);
>  
>  	if (emit_bbe) {
> -		igt_assert(bb_pos + sizeof(uint32_t) < blt->bb.size);
> -		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
> -		bb_pos += sizeof(uint32_t);
> +		igt_assert(offset + sizeof(bbe) < blt->bb.size);
> +		memcpy(bb + offset, &bbe, sizeof(bbe));
> +		offset += sizeof(bbe);
>  	}
>  
>  	if (blt->print_bb) {
> @@ -1732,7 +1733,8 @@ uint64_t emit_blt_fast_copy(int fd,
>  
>  	munmap(bb, blt->bb.size);
>  
> -	return bb_pos;
> +	/* Should return the DWORD offset */
> +	return DIV_ROUND_UP(offset, sizeof(uint32_t));
>  }
>  
>  /**
> -- 
> 2.43.0
> 
