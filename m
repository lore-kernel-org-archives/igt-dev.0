Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0CEC30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 17:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FA110E14E;
	Tue,  2 Jul 2024 17:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fi7hRlG7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBC710E14E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 17:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719940827; x=1751476827;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=Pq6zasG898dm7DpE3CAZtRBVHMAWaVMXwRXROt9cPwY=;
 b=Fi7hRlG7SBaqvrchxZYNHroqT+0msPyL9Z83KBW7tlrau4Ot09nTLrof
 u+24PcPGT1NyG14JDRP7ypvxa+jPedURvsoPkYSEtr1zjyTiB8oo+WDMH
 1KIs0PoM/74Q1LVFk4fWayUwRfHOyall5o4HqnWYFnYPBv+kR78pUBH70
 IWvomrEy4vXvJ+eGkhE/qyY9Z2tCHS36rmaFQ1ReJ2+8QcX1HBaCjaC0P
 vWTyPS7zltS3CAEuDNaYm+Q3pLlLkZ2QVGvJx/MHEDT0ZQ058eETBVvXF
 n6YlTr7oIKrVEBraJ3R8V8v+41t8uFJteoIzbPqcuLQyJrvPEeC4VkDde Q==;
X-CSE-ConnectionGUID: QzPgdRTfSmmXFV1PVz3Heg==
X-CSE-MsgGUID: 3UOLzfoMTfS4DF0n4noZUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20999782"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="20999782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 10:20:27 -0700
X-CSE-ConnectionGUID: DtbL43HbRt6Nb0NvHv2IKw==
X-CSE-MsgGUID: XVcuOpaqT6u+IYqmjpR69A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="45958168"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 10:20:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 Jul 2024 20:20:24 +0300
Date: Tue, 2 Jul 2024 20:20:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 6/6] lib/rendercopy: Enable clear color consistently
Message-ID: <ZoQ22BIzDwNizpWM@intel.com>
References: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
 <20240625174032.10398-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240625174032.10398-7-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
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

On Tue, Jun 25, 2024 at 08:40:32PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> We are computing the clear color enable bit differently
> for the reloc vs. what we stuff into the surface state
> directly. Unify.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  lib/rendercopy_gen9.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 04ec7ec99d9a..b4d34bc6864f 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -146,6 +146,12 @@ static const uint32_t xe2_render_copy[][4] = {
>  	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },
>  };
>  
> +static bool cc_enable(struct intel_bb *ibb,
> +		      const struct intel_buf *buf, bool fast_clear)
> +{
> +	return fast_clear || (buf->cc.offset && !HAS_FLATCCS(ibb->devid));

This whole thing is actually wrong. We just want the
buf->cc.offset!=0 check and nothing else, regardless of
platform. Otherwise sampling from previously fast
cleared buffers will not work correctly on dg2/etc.

> +}
> +
>  /* Mostly copy+paste from gen6, except height, width, pitch moved */
>  static uint32_t
>  gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> @@ -238,7 +244,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  
>  			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
>  								   read_domain, write_domain,
> -								   (buf->cc.offset ? (1 << 10) : 0)
> +								   (cc_enable(ibb, buf, fast_clear) ? (1 << 10) : 0)
>  								   | buf->ccs[0].offset,
>  								   intel_bb_offset(ibb) + 4 * 10,
>  								   buf->addr.offset);
> @@ -246,7 +252,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  			ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
>  		}
>  
> -		if (fast_clear || (buf->cc.offset && !HAS_FLATCCS(ibb->devid))) {
> +		if (cc_enable(ibb, buf, fast_clear)) {
>  			igt_assert(buf->compression == I915_COMPRESSION_RENDER);
>  
>  			ss->ss10.clearvalue_addr_enable = 1;
> -- 
> 2.44.2

-- 
Ville Syrjälä
Intel
