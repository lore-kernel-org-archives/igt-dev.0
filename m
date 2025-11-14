Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279BACE7A9B
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 09:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB0C10E042;
	Fri, 14 Nov 2025 09:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWYSI+Du";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A40210EA20
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763112730; x=1794648730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DX7kD/yewOPx8n5fPwGOkuZmKYHfS8gwd8rSw2Ak1ok=;
 b=XWYSI+DuftgR/j1OC/1YtyPPwxhxbY3+dw9nWlk5Q/eecGbFTHXIKBbs
 pebZkEf9455S+w5d/TmcrhCgnz/g4VBa+wJpk9u5/d8tg8hsTIhkoXoLm
 iXbRMvuFRdkjntES6BYteHfDu15uTFghbOAGnCxVrCgNGakKpqbhrANlU
 KMMK6xrJAG5yeiaG3oBBvGj/aWhY4B9QHS1aYs8GTpq8uWAZSfZni9qfC
 gndz2WirFKt9TpvchzYOfGOoop2yFKtSMGCXCWvM4QNidCfk5oP4PPyb2
 i3MJS/wZ51KJpaPzN5dg5jMwSBekUQ/deoXneIzsEYKGFOKbuUWirFpqj Q==;
X-CSE-ConnectionGUID: quTE4gT5RtmtIq6H+EFC9w==
X-CSE-MsgGUID: 3SjroR/sS5SQBHtF2iJuDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65363728"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="65363728"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 01:32:09 -0800
X-CSE-ConnectionGUID: 9xJ80oyvTje8VK6IE8xu+w==
X-CSE-MsgGUID: YA4rH6xRTyCK98bbHu8EdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="189032285"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 01:32:08 -0800
Date: Fri, 14 Nov 2025 10:32:05 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 2/2] xe_exercise_blt: Insert a flush between two
 consecutive FAST_COPY
Message-ID: <lnqqvfohd7ommgf3m4x37jr7vmjou52xx5nmjxp6gimz7mbddr@5yshvo4be37h>
References: <20251113141027.3803274-3-balasubramani.vivekanandan@intel.com>
 <20251113141027.3803274-4-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113141027.3803274-4-balasubramani.vivekanandan@intel.com>
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

On Thu, Nov 13, 2025 at 07:40:29PM +0530, Balasubramani Vivekanandan wrote:
> As per the spec, a flush is required between two dependent BLT
> instructions. In fast-copy-emit, the source of the second BLT
> instruction was the destination of the previous BLT instuction.
> Therefore a flush is required between them.
> 
> Bpsec: 57567,57555
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
> 
> v2, v3:
>   - Package the flush insert instructions into a helper function, making
>     it part of library (Matt)
> 
> ---
>  lib/intel_blt.c               | 29 +++++++++++++++++++++++++++++
>  lib/intel_blt.h               |  3 +++
>  tests/intel/xe_exercise_blt.c |  8 ++++++++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index b4daf4b8e..9192b6e81 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1629,6 +1629,35 @@ static void dump_bb_fast_cmd(struct gen12_fast_copy_data *data)
>  		 cmd[9], data->dw09.src_address_hi);
>  }
>  
> +/**
> + * emit_flush_dw:
> + * @fd: drm fd
> + * @blt: blitter data which provides the BB pointer
> + * @bb_pos: position at which to insert the flush command
> + *
> + * Function emits a flush instruction to the BB
> + *
> + * Returns:
> + * Next write position in batch.
> + */
> +uint64_t emit_flush_dw(int fd, const struct blt_copy_data *blt,
> +		       uint64_t bb_pos)
> +{
> +	uint32_t *bb;
> +
> +#define MI_FLUSH_DW_SIZE_BYTES (4 * sizeof(uint32_t))
> +
> +	igt_assert(bb_pos * sizeof(uint32_t) + MI_FLUSH_DW_SIZE_BYTES < blt->bb.size);

Please keep bb_pos as byte offset position, otherwise we have
inconsistent implementation across different emit functions.

--
Zbigniew

> +	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
> +	bb[bb_pos++] = MI_FLUSH_DW_CMD | 2;
> +	bb[bb_pos++] = 0;
> +	bb[bb_pos++] = 0;
> +	bb[bb_pos++] = 0;
> +	munmap(bb, blt->bb.size);
> +
> +	return bb_pos;
> +}
> +
>  /**
>   * emit_blt_fast_copy:
>   * @fd: drm fd
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 54a096c03..d75dbfcf1 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -263,6 +263,9 @@ int blt_ctrl_surf_copy(int fd,
>  		       uint64_t ahnd,
>  		       const struct blt_ctrl_surf_copy_data *surf);
>  
> +uint64_t emit_flush_dw(int fd, const struct blt_copy_data *blt,
> +		       uint64_t bb_pos);
> +
>  uint64_t emit_blt_fast_copy(int fd,
>  			    uint64_t ahnd,
>  			    const struct blt_copy_data *blt,
> diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> index a545654d3..266e311e6 100644
> --- a/tests/intel/xe_exercise_blt.c
> +++ b/tests/intel/xe_exercise_blt.c
> @@ -103,6 +103,14 @@ static int fast_copy_one_bb(int xe,
>  	blt_tmp.print_bb = blt->print_bb;
>  	bb_pos = emit_blt_fast_copy(xe, ahnd, &blt_tmp, bb_pos, false);
>  
> +	/*
> +	 * Bspec asks to insert a flush between two BLIT instructions to resolve
> +	 * BLIT level dependency. Though the spec is not clear in explaining
> +	 * it, HW team requested for a flush instuction between these two BLIT
> +	 * instuctions as they have a dependency.
> +	 */
> +	bb_pos = emit_flush_dw(xe, &blt_tmp, bb_pos);
> +
>  	/* Second blit */
>  	blt_copy_init(xe, &blt_tmp);
>  	blt_tmp.src = blt->mid;
> -- 
> 2.43.0
> 
