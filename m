Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C23CEBF92
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 08:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0267A10E43A;
	Tue, 18 Nov 2025 08:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAAeezNa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7799010E43A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 08:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763455654; x=1794991654;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0QW8BOxeIFcVQ7ItnGo0TlIP5X/Jzs6tQI/GQYigD58=;
 b=iAAeezNaEhC10v375KVRaILLOTBPQyYsXYNmcrxiqj85sTcKSOJjFPCg
 qgbwrnb20zBNVGudGMilTomanjysgfh90VqxneNe/1hu/Yz4O1s7+n32U
 35zMlrQkfL7EwYC4daxc/PG1XSQ4aoAm8/4uJlsBx75Wpg8UmuA7axxHV
 KhvPn7wmV0iMiPb8yQgOXt8MeiMFwK+SrHqGcQqdxoMP8WH+R1RLc8hhv
 /rag2ZYWO0N2FywK91yhR1YGc8ZTNpIW/PiUfVBeIsf4cbEmfjJ1kpY3H
 +eG1t3CQp4OQC2iLvdZmg7UA7h3PSfja3edIcpbE2oOfsSKBv9wSG1Ks4 w==;
X-CSE-ConnectionGUID: bw0gOn+7TqaIUCo6tQgzZQ==
X-CSE-MsgGUID: NSCZjtwpRFakN4uaTA3PSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65352071"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65352071"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:47:33 -0800
X-CSE-ConnectionGUID: KhKDJ3oOQfeSrUuVo3P/Xg==
X-CSE-MsgGUID: P5Sd3ztqQGG5wDqo/TO3hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="214093907"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.69])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:47:30 -0800
Date: Tue, 18 Nov 2025 09:47:29 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 2/2] xe_exercise_blt: Insert a flush between two
 consecutive FAST_COPY
Message-ID: <ezc3tpkasyzkzmgy4wllruk6qtnsw6aa4xshao4s56w55e25lx@qxf26i4h52hj>
References: <20251117101836.3892456-3-balasubramani.vivekanandan@intel.com>
 <20251117101836.3892456-4-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117101836.3892456-4-balasubramani.vivekanandan@intel.com>
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

On Mon, Nov 17, 2025 at 03:48:38PM +0530, Balasubramani Vivekanandan wrote:
> As per the spec, a flush is required between two dependent BLT
> instructions. In fast-copy-emit, the source of the second BLT
> instruction was the destination of the previous BLT instuction.
> Therefore a flush is required between them.
> 
> Bpsec: 57567,57555
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
> 
> v2, v3, v4:
>   - Package the flush insert instructions into a helper function, making
>     it part of library (Matt)
> 
> ___
>  lib/intel_blt.c               | 54 +++++++++++++++++++++++++++++++++++
>  lib/intel_blt.h               |  3 ++
>  tests/intel/xe_exercise_blt.c |  8 ++++++
>  3 files changed, 65 insertions(+)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index e63341a02..82e6186bf 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1629,6 +1629,60 @@ static void dump_bb_fast_cmd(struct gen12_fast_copy_data *data)
>  		 cmd[9], data->dw09.src_address_hi);
>  }
>  
> +struct xe_flush_dw_cmd {
> +	struct {
> +		uint32_t length:	BITRANGE(0, 5);
> +		uint32_t rsvd0:		BITRANGE(6, 7);
> +		uint32_t notify_en: 	BITRANGE(8, 8);
> +		uint32_t flush_llc:	BITRANGE(9, 9);
> +		uint32_t rsvd1:		BITRANGE(10, 13);
> +		uint32_t postsync:	BITRANGE(14, 15);
> +		uint32_t flush_ccs:	BITRANGE(16, 16);
> +		uint32_t rsvd2:		BITRANGE(17, 17);
> +		uint32_t tlb_inval:	BITRANGE(18, 18);
> +		uint32_t rsvd3:		BITRANGE(19, 20);
> +		uint32_t store_index:	BITRANGE(21, 21);
> +		uint32_t rsvd4:		BITRANGE(22, 22);
> +		uint32_t opcode:	BITRANGE(23, 28);
> +		uint32_t client:	BITRANGE(29, 31);
> +	} dw00;
> +
> +	uint32_t dw01;
> +	uint32_t dw02;
> +	uint32_t dw03;
> +	uint32_t dw04;
> +};
> +
> +/**
> + * emit_xe_flush_dw:
> + * @fd: drm fd
> + * @blt: blitter data which provides the BB pointer
> + * @bb_pos: position at which to insert the flush command
> + *
> + * Function emits a flush instruction to the BB
> + *
> + * Returns:
> + * Next write position in batch.
> + */
> +uint64_t emit_xe_flush_dw(int fd, const struct blt_copy_data *blt,
> +			  uint64_t bb_pos)
> +{
> +	uint8_t *bb;
> +	struct xe_flush_dw_cmd data = {};
> +
> +	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
> +
> +	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
> +	data.dw00.opcode = 0x26;
> +	data.dw00.length = 3;
> +	memcpy(bb + bb_pos, &data, sizeof(data));
> +	bb_pos += sizeof(data);
> +
> +	munmap(bb, blt->bb.size);
> +
> +	return bb_pos;
> +}
> +
>  /**
>   * emit_blt_fast_copy:
>   * @fd: drm fd
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 54a096c03..c87178abf 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -263,6 +263,9 @@ int blt_ctrl_surf_copy(int fd,
>  		       uint64_t ahnd,
>  		       const struct blt_ctrl_surf_copy_data *surf);
>  
> +uint64_t emit_xe_flush_dw(int fd, const struct blt_copy_data *blt,
> +			  uint64_t bb_pos);
> +
>  uint64_t emit_blt_fast_copy(int fd,
>  			    uint64_t ahnd,
>  			    const struct blt_copy_data *blt,
> diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> index a545654d3..e24a48abf 100644
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
> +	bb_pos = emit_xe_flush_dw(xe, &blt_tmp, bb_pos);
> +
>  	/* Second blit */
>  	blt_copy_init(xe, &blt_tmp);
>  	blt_tmp.src = blt->mid;
> -- 
> 2.43.0
> 
