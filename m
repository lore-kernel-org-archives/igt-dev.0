Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D04C3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC8D10E212;
	Tue, 13 May 2025 18:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWa6kFUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B45310E212
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747159436; x=1778695436;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mabodLnS2JSWPYVJSFVlUEsL5JcwJOjOJB3y19lfnMk=;
 b=OWa6kFUii9ntQ5nTVA/MyPkOVVKGVRNFhIiTGinncF5YhFD6ZbQIhzhk
 Cj8Q/zkmkdv7ON042mtsLNApdY37Mh5Q12j37vlwahiNw1cm3nnYndrbY
 0QH8e1iiguuSpSbQLcZhSns50kVJhPcksM4TbXG8TcuonI+eB+Tm0pzOJ
 Kpf8rsR7i39FVstac63ptvk1l1Y831N+KeSVIdJqVXKXEdwBDFQzukR+c
 CNPOq8ioWFHGBoQKpuquOUonawSFcjgTxE9GXCdG2Y7OVSumKeSJXaVZW
 Yq8UUL8ajBeevjN2uG8KP50GObr83L0oKNeVOBgQD1GvP38f7rMslyt62 g==;
X-CSE-ConnectionGUID: 5S0fHM/SSAaeT6QX5Dnhlg==
X-CSE-MsgGUID: k4T1QIyyRlO5urKS6FW8Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="59253534"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="59253534"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:03:56 -0700
X-CSE-ConnectionGUID: TiAaSS4ISkqfSv4Jj4bpLQ==
X-CSE-MsgGUID: x/M0c/gUQAq1g9s4gPSMQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="168716943"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:03:55 -0700
Date: Tue, 13 May 2025 20:03:49 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] lib/xe_spin: limit width/pitch for mem-copy
Message-ID: <ypanhnk56ha6gli657bhd2qp6kho2yzuwr4r7fp2ruzeveeq5r@7yxndnde7siu>
References: <20250509074645.56169-1-zbigniew.kempczynski@intel.com>
 <20250509074645.56169-2-zbigniew.kempczynski@intel.com>
 <aCGn0-bixj-y2_2x@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCGn0-bixj-y2_2x@fdugast-desk>
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

On Mon, May 12, 2025 at 09:48:35AM +0200, Francois Dugast wrote:
> Hi,
> 
> On Fri, May 09, 2025 at 09:46:44AM +0200, Zbigniew Kempczyński wrote:
> > Mem-copy for byte copy requires width/pitch to be max 256K
> > (higher bits have different meaning and setting them might lead
> > to undefined behavior). If witch/pitch are too high limit them to
> > the maximum possible for the operation. Asserting might lead to
> > test stucking in multithreading scenarios so displaying warning
> > was selected instead.
> 
> Might be good to add this as a comment in the code to prevent someone
> from replacing igt_warn() with igt_assert() in the future.

This depends how library is used. I've noticed that in render-copy
stress scenarios - if during xe_spin_init_opts() we assert pthread
won't be unlocked and we stuck in main thread which just waits for
unlocking the mutex. I sometimes use assertions in library code
(if arguments won't allow to work code properly or just ends with
sigsegv). So I would like to keep code without this comment -
it might be confusing and I think proper review is better for catching
such cases.

> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/xe/xe_spin.c | 33 +++++++++++++++++++++++++++++----
> >  1 file changed, 29 insertions(+), 4 deletions(-)
> > 
> > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> > index a92903b6bd..7ff06cab3b 100644
> > --- a/lib/xe/xe_spin.c
> > +++ b/lib/xe/xe_spin.c
> > @@ -126,11 +126,36 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
> >  	}
> >  
> >  	if (opts->mem_copy) {
> > +		uint32_t src_width, src_pitch, dst_width, dst_pitch;
> > +
> > +		src_width = opts->mem_copy->src->width;
> > +		src_pitch = opts->mem_copy->src->pitch;
> > +		dst_width = opts->mem_copy->dst->width;
> > +		dst_pitch = opts->mem_copy->dst->pitch;
> > +
> > +		if (src_width > dst_width)
> > +			igt_warn("src width must be <= dst width\n");
> 
> Should we not also override the value in that case?
> 
>     src_width = dst_width

Hmm, that's not bad idea. Soon or later we will need to fix the code
but at least spinner should work fine with this mem-copy code.

> 
> > +
> > +		if (src_width > SZ_256K) {
> > +			igt_warn("src width must be less than 256K, limiting it\n");
> > +			src_width = SZ_256K;
> > +		}
> > +
> > +		if (src_pitch > SZ_256K) {
> > +			igt_warn("src pitch must be less than 256K, limiting it\n");
> > +			src_pitch = SZ_256K;
> > +		}
> > +
> > +		if (dst_pitch > SZ_256K) {
> > +			igt_warn("dst pitch must be less than 256K, limiting it\n");
> > +			dst_pitch = SZ_256K;
> > +		}
> > +
> >  		spin->batch[b++] = MEM_COPY_CMD;
> > -		spin->batch[b++] = opts->mem_copy->src->width - 1;
> > -		spin->batch[b++] = opts->mem_copy->src->height - 1;
> > -		spin->batch[b++] = opts->mem_copy->src->pitch - 1;
> > -		spin->batch[b++] = opts->mem_copy->dst->pitch - 1;
> > +		spin->batch[b++] = src_width - 1;
> > +		spin->batch[b++] = 1;  /* for byte copying this is ignored */
> > +		spin->batch[b++] = src_pitch - 1;
> > +		spin->batch[b++] = dst_pitch - 1;
> >  		spin->batch[b++] = opts->mem_copy->src_offset;
> >  		spin->batch[b++] = opts->mem_copy->src_offset << 32;
> >  		spin->batch[b++] = opts->mem_copy->dst_offset;
> 
> LGTM, let's wait to see the CI results for v2 with the fix for xe_spin_batch:
> 
>     Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> 
> Francois

Thanks for the review, but I had to extend the series so I'll ask
you for the review one more time.

--
Zbigniew

> 
> > -- 
> > 2.43.0
> > 
