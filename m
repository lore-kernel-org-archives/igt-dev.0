Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB3DCA0FFE
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 10:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FB010E649;
	Tue,  2 Sep 2025 10:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9mxUDh6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE1B10E649
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 10:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756807726; x=1788343726;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BLir16YmdAZ9M9mwpe75CXoCK2SpROwy1RGj7XrL+hA=;
 b=S9mxUDh6BsupUnOO5Lm2p2MaEzZGZwoasTxgL2RbqUwChpeLr6aDN1C4
 +f5RVzIpPSlA0+WtELHgb7RdowsaUYU2+4XT6J2m8fe/0/Gz5j7EZAbT/
 ds0yI6A5GseDw6dE/Hg97PHh6BqKGNx6YzkVBytQed6LL7TeMGFNVny4u
 nWCty/7PXUA/ZMGYvmL5P50TrBLcRbQQKmkFznKdYIcY5RB82NWjLmzcH
 P9brQoiv3h0ZubE4+UklIJfLC91FYay3ZWH3oGjCx0vFu2nmNzeFUr5OR
 JEJB5M01u+qxEPfJsgMxiKyIna5VG2CUDLU2eHIyN1AVCOJE29KHO6UPP Q==;
X-CSE-ConnectionGUID: brh/xNrqSuC9muTKHs40Rg==
X-CSE-MsgGUID: h3vv7X33S3mtbpVNJd91fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58771168"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="58771168"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:08:46 -0700
X-CSE-ConnectionGUID: tjosi0enQ/6Zd/r1xJifYQ==
X-CSE-MsgGUID: ysLY3GcOTQO3de19Oe+jMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="175602582"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:08:44 -0700
Date: Tue, 2 Sep 2025 12:08:42 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] lib/intel_blt: Fix MEM_SET instruction for Xe2+ platforms
Message-ID: <wdrbx2nwb4qonrgoeljvtp3vbmwvsvhth7wnasecmqcfdye75i@jqsvzerjq3gj>
References: <20250901084534.909825-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250901084534.909825-1-balasubramani.vivekanandan@intel.com>
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

On Mon, Sep 01, 2025 at 02:15:34PM +0530, Balasubramani Vivekanandan wrote:
> The structure of the MEM_SET instruction has changed related to the
> destination MOCS starting with Xe2 platforms.
> 
> Bspec: 57562
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  lib/intel_blt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 8a05f482f..71ed891c3 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -2117,6 +2117,7 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd,
>  	int b;
>  	uint32_t *batch;
>  	uint32_t value;
> +	uint32_t devid = intel_get_drm_devid(fd);
>  
>  	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
>  					  0, mem->dst.pat_index);
> @@ -2131,7 +2132,11 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd,
>  	batch[b++] = mem->dst.pitch - 1;
>  	batch[b++] = dst_offset;
>  	batch[b++] = dst_offset << 32;
> -	batch[b++] = value | mem->dst.mocs_index;
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
> +		batch[b++] = value | (mem->dst.mocs_index << 3);
> +	else
> +		batch[b++] = value | mem->dst.mocs_index;
> +

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	batch[b++] = MI_BATCH_BUFFER_END;
>  
>  	munmap(batch, mem->bb.size);
> -- 
> 2.34.1
> 
