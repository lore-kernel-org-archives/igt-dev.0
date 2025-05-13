Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF31C3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628B210E212;
	Tue, 13 May 2025 18:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cq8Rp+/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BD010E212
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747159542; x=1778695542;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tYK0/gZuRNrdKb8srAYOD276uCJX8OzpWAOFTLtrZH0=;
 b=cq8Rp+/gJ03f2ODMBV7fX1PhXwY2IQGTizQ5qO6RoFDpA1G5bszsNLT7
 FR7uatz0fdB/9bGqey/rDg2HJXW9Xn0Aaypt+YL8bGOMrB6ic0oOCKmYj
 IwMiw5QsRlyK/NY2nYeybHEIVfxnBoanLv8wHu4epXi0qkXxcQBKGCKQe
 y9kuhkkGwrOlbPTBdzSzufZ7trI+MIIu94dtKNtiQKLViB1n45r9eIA0Y
 hx0Ds9WWHsPHWpv05KssL7oN/AVDgFP5seRb55xPBRZw0hR5C/ZFyzGIE
 LqWnyo2rAU9yO8YuYWE6CMj+KK1XavFIGi4OBtTAboQUDAl48sCd3u9Mx Q==;
X-CSE-ConnectionGUID: FFpmGtctRzKCdCb3oxtEoA==
X-CSE-MsgGUID: JcNhqoNLQg2t5ZZJGLY7SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="59253656"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="59253656"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:05:40 -0700
X-CSE-ConnectionGUID: Aus5R4WTRq2eQeCzs5mQow==
X-CSE-MsgGUID: Spng8BrsTP+WHr6hZ0Mc3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="138759132"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:05:39 -0700
Date: Tue, 13 May 2025 20:05:35 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/xe_render_copy: change width and pitch
 to be in valid range
Message-ID: <7p34t2kwn4dcybwpiwxzevmoz7yfa2hoe44cgmmt2hng2hqb62@gwocihbcrpk2>
References: <20250509074645.56169-1-zbigniew.kempczynski@intel.com>
 <20250509074645.56169-3-zbigniew.kempczynski@intel.com>
 <aCGpXL0AA8GMZHBp@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCGpXL0AA8GMZHBp@fdugast-desk>
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

On Mon, May 12, 2025 at 09:55:08AM +0200, Francois Dugast wrote:
> On Fri, May 09, 2025 at 09:46:45AM +0200, Zbigniew Kempczyński wrote:
> > For mem-copy (byte mode) width and pitch must be lesser or equal 256K.
> > Limit them avoiding setting inappropriate bits in mem-copy operation.
> 
> Maybe a comma would help: "Limit them, avoiding...".
> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  tests/intel/xe_render_copy.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> > index fadfd162ce..9f16537c1e 100644
> > --- a/tests/intel/xe_render_copy.c
> > +++ b/tests/intel/xe_render_copy.c
> > @@ -445,7 +445,7 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
> >  			  uint64_t ahnd, uint32_t region, struct xe_spin **spin,
> >  			  pthread_mutex_t *lock_init_spin)
> >  {
> > -	uint32_t copy_size = SZ_4M;
> > +	uint32_t copy_size = SZ_256K;
> 
> This matches the commit message.
> 
> >  	/* Keep below 5 s timeout */
> >  	uint64_t duration_ns = NSEC_PER_SEC * 4.5;
> >  	intel_ctx_t *ctx;
> > @@ -468,10 +468,10 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
> >  	/* Create source and destination objects used for the copy */
> >  	src_handle = xe_bo_create(fd, 0, copy_size, region, 0);
> >  	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
> > -	blt_set_mem_object(mem_copy.src, src_handle, copy_size, 0, width, height, region,
> > +	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
> 
> Why changing the pitch value here and below?

In the code we do: pitch - 1, what in turn gives us all bits turned on
what violates specification.

--
Zbigniew

> 
> Francois
> 
> >  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> >  			   M_LINEAR, COMPRESSION_DISABLED);
> > -	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, 0, width, height, region,
> > +	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
> >  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> >  			   M_LINEAR, COMPRESSION_DISABLED);
> >  	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
> > -- 
> > 2.43.0
> > 
