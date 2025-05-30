Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06BDC3ABB2
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 06:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D6210E79E;
	Fri, 30 May 2025 06:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/luYuhL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DA110E79E
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 06:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748585867; x=1780121867;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1n5GQSwdyx6W4TDWC1mXpm42BQzuj2peihyeg1uYf5A=;
 b=X/luYuhL3xwg1FiYRC8MRG53GlS9QC4YNZuEofUFPw1KMr3MnEUhC+B2
 a0XO7A33XQH1xCycwVLcv6XgqJIcyKl5Djf8xm3ij4oG9e2Cg7sERuzpP
 BpIH7VM28qZDVY6eZkpqM9hyoDi00kB32RF5CvpAIc4fqJnP2MtxGCWba
 OBFk1a2uKTcwEmzUQNm3yGhsr/GMJpqhFiGn5tk/t9RPEn+DB6VbinCQ7
 haxt0MRO1eT7xIRmVzwSOoRE481FYmj1nirjUJ7fes86eNFJzVwidailT
 ytGqKMmkTCUzBOXa1P9p9QhUsyAIqDugXQU3/tVMDSWn9xHJhLIAMz+tZ A==;
X-CSE-ConnectionGUID: QIarrdz0Ti2z0pCvd9RlAw==
X-CSE-MsgGUID: 4dLFdNPbTIq5ogvtnCvdGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="54468391"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="54468391"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:17:47 -0700
X-CSE-ConnectionGUID: sSA3ion/R0+bQUqJdnK0Bw==
X-CSE-MsgGUID: Mtv7YssvRy22SIX25RdJjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="148934119"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:17:47 -0700
Date: Fri, 30 May 2025 08:17:42 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 09/11] lib/intel_blt: add support for matrix
 mem-copy
Message-ID: <niwj7kceuyo6pmwepfn5mfo7ifcvbypauz5krfhvzgccipsffx@dvkps34kmt42>
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
 <20250523080126.75295-10-zbigniew.kempczynski@intel.com>
 <aDbIDROnBnbIbMOM@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDbIDROnBnbIbMOM@fdugast-desk>
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

On Wed, May 28, 2025 at 10:23:41AM +0200, Francois Dugast wrote:
> On Fri, May 23, 2025 at 10:01:24AM +0200, Zbigniew Kempczyński wrote:
> > Linear copy in intel_blt supports passing large buffers (which
> > requires to be spread over couple mem-copies). For matrix this is
> > a little bit more complicated so I left simple case in which
> 
> Patch LGTM but a nit: impersonal style is preferred over "I did X". 

Ok, reprhased this. Check if it is ok now, anyway I applied r-b.

--
Zbigniew

> 
> With that:
> 
>     Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> 
> > pitch/width/height must be within mem-copy command limits -
> > 18-bit width * 18-bit height gives 64GiB object so testing
> > copying bigger buffer would be an overkill.
> > 
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  lib/intel_blt.c | 69 +++++++++++++++++++++++++++++++++----------------
> >  1 file changed, 47 insertions(+), 22 deletions(-)
> > 
> > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > index 265f5ed50f..77a03aff4e 100644
> > --- a/lib/intel_blt.c
> > +++ b/lib/intel_blt.c
> > @@ -1893,17 +1893,18 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
> >  {
> >  	struct xe_mem_copy_data data = {};
> >  	uint64_t dst_offset, src_offset, shift;
> > -	uint32_t height, width_max, remain;
> > +	uint32_t width, height, width_max, height_max, remain;
> >  	uint32_t bbe = MI_BATCH_BUFFER_END;
> >  	uint32_t *bb;
> >  
> >  	if (mem->mode == MODE_BYTE) {
> >  		data.dw01.byte_copy.width = -1;
> > -		width_max = data.dw01.byte_copy.width + 1;
> > +		height_max = width_max = data.dw01.byte_copy.width + 1;
> >  		shift = width_max;
> >  	} else {
> >  		data.dw01.page_copy.width = -1;
> >  		width_max = data.dw01.page_copy.width + 1;
> > +		height_max = 1;
> >  		shift = width_max << 8;
> >  	}
> >  
> > @@ -1914,6 +1915,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
> >  
> >  	bb = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
> >  
> > +	width = mem->src.width;
> >  	height = mem->dst.height;
> >  
> >  	data.dw00.client = 0x2;
> > @@ -1930,34 +1932,57 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
> >  	data.dw09.src_mocs = mem->src.mocs_index;
> >  	data.dw09.dst_mocs = mem->dst.mocs_index;
> >  
> > -	remain = mem->src.width;
> > +	/* For matrix we don't iterate */
> > +	if (mem->copy_type == TYPE_MATRIX) {
> > +		if (width > width_max) {
> > +			width = width_max;
> > +			igt_warn("src width is bigger than max width [%u > %u => %u], truncating it\n",
> > +				 mem->src.width, width_max, width);
> > +		}
> >  
> > -	/* Truncate pitches to match operation bits */
> > -	if (mem->src.pitch > width_max)
> > -		data.dw03.src_pitch = width_max - 1;
> > -	else
> > -		data.dw03.src_pitch = mem->src.pitch;
> > +		if (height > height_max) {
> > +			height = height_max;
> > +			igt_warn("src height is bigger than max height [%u > %u => %u], truncating it\n",
> > +				 mem->src.height, height_max, height);
> > +		}
> >  
> > -	if (mem->dst.pitch > width_max)
> > -		data.dw04.dst_pitch = width_max - 1;
> > -	else
> > -		data.dw04.dst_pitch = mem->dst.pitch;
> > -
> > -	while (remain) {
> > -		data.dw01.val = min_t(uint32_t, width_max, remain) - 1;
> > +		data.dw01.byte_copy.width = width - 1;
> > +		data.dw03.src_pitch = mem->src.pitch - 1;
> > +		data.dw04.dst_pitch = mem->dst.pitch - 1;
> >  
> >  		igt_assert(bb_pos + sizeof(data) < mem->bb.size);
> >  		memcpy(bb + bb_pos, &data, sizeof(data));
> >  		bb_pos += sizeof(data);
> > +	} else {
> > +		remain = mem->src.width;
> >  
> > -		remain -= remain > width_max ? width_max : remain;
> > -		src_offset += shift;
> > -		dst_offset += shift;
> > +		/* Truncate pitches to match operation bits */
> > +		if (mem->src.pitch > width_max)
> > +			data.dw03.src_pitch = width_max - 1;
> > +		else
> > +			data.dw03.src_pitch = mem->src.pitch;
> >  
> > -		data.dw05.src_address_lo = src_offset;
> > -		data.dw06.src_address_hi = src_offset >> 32;
> > -		data.dw07.dst_address_lo = dst_offset;
> > -		data.dw08.dst_address_hi = dst_offset >> 32;
> > +		if (mem->dst.pitch > width_max)
> > +			data.dw04.dst_pitch = width_max - 1;
> > +		else
> > +			data.dw04.dst_pitch = mem->dst.pitch;
> > +
> > +		while (remain) {
> > +			data.dw01.val = min_t(uint32_t, width_max, remain) - 1;
> > +
> > +			igt_assert(bb_pos + sizeof(data) < mem->bb.size);
> > +			memcpy(bb + bb_pos, &data, sizeof(data));
> > +			bb_pos += sizeof(data);
> > +
> > +			remain -= remain > width_max ? width_max : remain;
> > +			src_offset += shift;
> > +			dst_offset += shift;
> > +
> > +			data.dw05.src_address_lo = src_offset;
> > +			data.dw06.src_address_hi = src_offset >> 32;
> > +			data.dw07.dst_address_lo = dst_offset;
> > +			data.dw08.dst_address_hi = dst_offset >> 32;
> > +		}
> >  	}
> >  
> >  	if (emit_bbe) {
> > -- 
> > 2.43.0
> > 
