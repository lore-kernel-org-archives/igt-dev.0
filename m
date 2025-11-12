Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A7ECCF9F8
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 09:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9AC10E00A;
	Wed, 12 Nov 2025 09:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GK3O8cpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AC010E03A
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762938378; x=1794474378;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8wGVcovUenTReyJDbv17cVwO6xWx84tBamvGl1K3jBM=;
 b=GK3O8cpG+WpBTGw47Nob++hYNpig9P0Hp5F+KA+1CSpJr8g9BnstaWNq
 +Jkh9ZvFNS9R6EIyVc4gYV0gFVBe42/mvL+2lofDSGEwMHBZ5A0NmNwdr
 0puseKOzj8wtoZP1aDI5XRv5uMrjQXtt7/lka/kWGQTHFo+0F4MF06bKr
 r8uA0jihv3ZMLM6Cn23q+/NGNFjzOQdNRZ3p7kqm2q+cx8vsUh89vbpHf
 87JnVxKgjlrcfhGLtHTD0H9Royf0PZu2AlsecjVoRj2eV3NzdkmFkDLqK
 /O+xvQQxi7v3KeqcZoyBUeKJx131EIB3xS2XjnB3fWag4H09ETo0NvaV4 Q==;
X-CSE-ConnectionGUID: yAhZ2EPOTYK6L6BFc7RB/Q==
X-CSE-MsgGUID: JaMppl9+TbSoFQkkQBI01A==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64004129"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="64004129"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 01:06:18 -0800
X-CSE-ConnectionGUID: tVLmjB4rTAyIK7wd/NyTXg==
X-CSE-MsgGUID: QCHvpo6ZTiWDMP00yYAwCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189895473"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.194])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 01:06:17 -0800
Date: Wed, 12 Nov 2025 10:06:14 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, 
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 2/2] xe_exercise_blt: Insert a flush between two
 consecutive FAST_COPY
Message-ID: <thhxod63okvgwseorammrzff6ytzhmbtkd4qkywuaebng4ks7a@dipvmrmy5fta>
References: <20251110135805.3620715-3-balasubramani.vivekanandan@intel.com>
 <20251110135805.3620715-4-balasubramani.vivekanandan@intel.com>
 <20251111004004.GN3905809@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111004004.GN3905809@mdroper-desk1.amr.corp.intel.com>
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

On Mon, Nov 10, 2025 at 04:40:04PM -0800, Matt Roper wrote:
> On Mon, Nov 10, 2025 at 07:28:07PM +0530, Balasubramani Vivekanandan wrote:
> > As per the spec, a flush is required between two dependent BLT
> > instructions. In fast-copy-emit, the source of the second BLT
> > instruction was the destination of the previous BLT instuction.
> > Therefore a flush is required between them.
> 
> So this is effectively a read-after-write (RAW) hazard, right?

If I'm not wrong bspec says:

1. flush is required if we mix legacy and new fast blit commands, or
2. different sources are copied to single destination, in this case
   there's risk of out-of-order execution.

But I haven't found in sequence of obj1->obj2->obj3 flush is necessary.

--
Zbigniew

> 
> > 
> > Bpsec: 57567,57555
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  include/intel_gpu_commands.h  |  4 ++++
> >  tests/intel/xe_exercise_blt.c | 14 ++++++++++++++
> >  2 files changed, 18 insertions(+)
> > 
> > diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
> > index cd281ba89..f6d367442 100644
> > --- a/include/intel_gpu_commands.h
> > +++ b/include/intel_gpu_commands.h
> > @@ -445,6 +445,10 @@
> >  
> >  #define XE2_STATE_SIP \
> >  	((0x3 << 29) | (0x0 << 27) | (0x1 << 24) | (0x1 << 17))
> > +
> > +#define XE2_MI_FLUSH_DW		(0x26 << 23)
> > +#define   FLUSH_LEN_DW		(2)
> > +#define   FLUSH_LEN_QW		(3)
> 
> This isn't really for Xe2; according to bspec 6997, MI_FLUSH_DW switched
> from taking a 32-bit address to a 64-bit address (and thus the size of
> the instruction increased by one) all the way back in gen8 (BDW).
> 
> We should either make this something like MI_FLUSH_DW_GEN8, or just use
> "MI_FLUSH_DW_CMD | 2" down below like other spots in IGT already do.  If
> the former, we should also use MI_INSTR rather than an open-coded shift.
> 
> >  /*
> >   * Used to convert any address to canonical form.
> >   * Starting from gen8, some commands (e.g. STATE_BASE_ADDRESS,
> > diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> > index a545654d3..06a2eedca 100644
> > --- a/tests/intel/xe_exercise_blt.c
> > +++ b/tests/intel/xe_exercise_blt.c
> > @@ -86,6 +86,7 @@ static int fast_copy_one_bb(int xe,
> >  	uint64_t bb_offset, alignment;
> >  	uint64_t bb_pos = 0;
> >  	int ret = 0;
> > +	uint32_t *bb;
> >  
> >  	alignment = xe_get_default_alignment(xe);
> >  
> > @@ -103,6 +104,19 @@ static int fast_copy_one_bb(int xe,
> >  	blt_tmp.print_bb = blt->print_bb;
> >  	bb_pos = emit_blt_fast_copy(xe, ahnd, &blt_tmp, bb_pos, false);
> >  
> > +	bb = xe_bo_map(xe, blt->bb.handle, blt->bb.size);
> > +	/*
> > +	 * Bspec asks to insert a flush between two BLIT instructions to resolve
> > +	 * BLIT level dependency. Though the spec is not clear in explaining
> > +	 * it, HW team requested for a flush instuction between these two BLIT
> > +	 * instuctions as they have a dependency.
> > +	 */
> > +	bb[bb_pos++] = XE2_MI_FLUSH_DW | FLUSH_LEN_DW;
> > +	bb[bb_pos++] = 0;
> > +	bb[bb_pos++] = 0;
> > +	bb[bb_pos++] = 0;
> > +	munmap(bb, blt->bb.size);
> 
> This feels like a general facility that should probably be an emit_*()
> instruction somewhere like lib/intel_blt.c so that it can be used in any
> test that needs it.
> 
> 
> Matt
> 
> > +
> >  	/* Second blit */
> >  	blt_copy_init(xe, &blt_tmp);
> >  	blt_tmp.src = blt->mid;
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
