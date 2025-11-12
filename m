Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C22CCFA1A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 09:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7CC10E00A;
	Wed, 12 Nov 2025 09:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEXyDdqe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA70E10E00A
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762938187; x=1794474187;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vowhC05UOSykcZM/KUK5FdVomz8Lr3axzKEqL0exU2Q=;
 b=ZEXyDdqeA4aPG7Ka79Z596ryKFpu9ibQaGtbhmwO0+TJHde+zXoZAHZ5
 5eKkqZjSjUskyJfIkfoSFoOn/xaItMJYv9aTBoUeCI2FahdieAkSVO2L/
 2BFAHkSVZ0DRqEcWRlozCKFFBN2bfbgztr728bgcqtgYZcDnBPlI7+Mh6
 VlAjf5NZVWW1IIUAYzMdG6o1vsFC7wC+8eSiZOg/zitL58xNzHddO8Yrn
 6Uc8kmRU3mVmmSMxlMn27yPz7Q72BY/4oZMccDLW3OlIUtRqH8sXkUQEG
 BWT5GwzwQe5ZBo75n6pHUnUim6RdgGtd58JZ33NWn3TVJ9JE7Z/lyPQ9H A==;
X-CSE-ConnectionGUID: 4DkVK972S2u1xumL7+CBdw==
X-CSE-MsgGUID: AD6qdPI0QtGlBCNgmHYKOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="52557219"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="52557219"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 01:03:03 -0800
X-CSE-ConnectionGUID: BQ++xWTlT4WfbB2+ah6A5w==
X-CSE-MsgGUID: qcLUUDNWToi0QoN+RKK3ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188943057"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.194])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 01:03:02 -0800
Date: Wed, 12 Nov 2025 10:02:59 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 1/2] lib/intel_blt: BB index should be incremented in
 dwords
Message-ID: <cxtfv3ro7vivi7qn33tdfnddrnla6dg46ya2xhla5dens4iwei@4oxagajtrt5s>
References: <20251110135805.3620715-3-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110135805.3620715-3-balasubramani.vivekanandan@intel.com>
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

On Mon, Nov 10, 2025 at 07:28:06PM +0530, Balasubramani Vivekanandan wrote:
> Size in bytes in used to increment the BB index, which is incorrect.
> Convert bytes to number of dwords.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  lib/intel_blt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 7f7f5485e..9a0bcb96b 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1714,7 +1714,7 @@ uint64_t emit_blt_fast_copy(int fd,
>  
>  	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
>  	memcpy(bb + bb_pos, &data, sizeof(data));
> -	bb_pos += sizeof(data);
> +	bb_pos += DIV_ROUND_UP(sizeof(data), sizeof(*bb));

Good catch. I think best is to change bb to uint8_t * in all the places.
We write directly to bb position, without accessing them by index
(we memcopy command structure directly there).

--
Zbigniew

>  
>  	if (emit_bbe) {
>  		igt_assert(bb_pos + sizeof(uint32_t) < blt->bb.size);
> -- 
> 2.43.0
> 
