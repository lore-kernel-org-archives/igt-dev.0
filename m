Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2ADC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 07:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CB910F78D;
	Fri, 19 Apr 2024 07:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gf64z82x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6570710F78D
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 07:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713512507; x=1745048507;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dVg8DJBJE2YXObaIRznf1hHToLxbAleha0ull7Uvmkc=;
 b=Gf64z82xzTpz45HuhqTvjFD9QNuZ4ypLbh6hqBhsQppX5Mj4PxLKhyrc
 R6q74BaoHiKdxyNNPTJBsZWXxOdNFaLNC0hVY/Bck0AprcwN8bKSwrk/K
 RHjjI9nzEXD3Vb0wlPgJCDDB9RmS7KBz40ZJD6IrIdji5lhNLqENu/wRC
 lfPMJTACZCO46sUFKVM6BZo3uCPj3HqMQ0EDWrl20vUVWZBvgBXyf8fiq
 HCX/Iw8YkGT5PX6TSifuVc6KzQbXMzfs87EAX5YWZWkeuXLEnalhz5vuD
 f+gZnXX+FPgjL3rI+wtQ7aM+3QeSbdYkYgoBqzCJ3ztoyOR+Rc3oJZI2U g==;
X-CSE-ConnectionGUID: msObIwwKSr+CE51daWrX1Q==
X-CSE-MsgGUID: 0z/GqbtNSy2jzV2Qc6jpVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8973442"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8973442"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 00:41:47 -0700
X-CSE-ConnectionGUID: cjMgl3emR/KkmGP5ivDWGg==
X-CSE-MsgGUID: nRqkq1bJS12xCljky4VQjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23286586"
Received: from unknown (HELO localhost) ([10.245.246.244])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 00:41:45 -0700
Date: Fri, 19 Apr 2024 09:41:42 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v6 2/2] tests/xe_ccs: Update compression check
 based on flat-ccs enablement
Message-ID: <20240419074142.a6up4pxdrhytru4s@zkempczy-mobl2>
References: <cover.1713429755.git.akshata.jahagirdar@intel.com>
 <0cfbaccb86155a3e5b6fc5c68447848fb08c51ef.1713429755.git.akshata.jahagirdar@intel.com>
 <20240418135949.ow7vnpidfjeclzcp@zkempczy-mobl2>
 <f32bd45b-e8c0-445c-bfa9-89ad216c4f0c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f32bd45b-e8c0-445c-bfa9-89ad216c4f0c@intel.com>
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

On Thu, Apr 18, 2024 at 11:36:37PM -0700, Jahagirdar, Akshata wrote:
> 
> On 4/18/2024 6:59 AM, Zbigniew Kempczyński wrote:
> > On Thu, Apr 18, 2024 at 01:46:43AM -0700, Akshata Jahagirdar wrote:
> > > In Xe2+ platforms,we need to run this test regardless of the status of flat-ccs.
> > > Check if the platform supports compression and has flat ccs enabled, and if it
> > > doesn't, then update the checks accordingly and proceed with the test.
> > > 
> > > Additionally, On Xe2 dGPU, compression is only supported with VRAM. When copying
> > > from VRAM -> sysmem the KMD uses mapping with uncompressed PAT so the copy
> > > in system memory is guaranteed to be uncompressed. When restoring such buffers
> > > from sysmem -> VRAM the KMD can't easily know which pages were originally
> > > compressed, so we always use uncompressed -> uncompressed here. so this means
> > > there's no need for extra CCS storage on such platforms.
> > > Thats why we shouldn't need to run suspend-resume on xe2 dgpu.
> > > 
> > > Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > > Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > ---
> > >   tests/intel/xe_ccs.c | 26 ++++++++++++++++++++++----
> > >   1 file changed, 22 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> > > index b3bf97af7..d6148dc44 100644
> > > --- a/tests/intel/xe_ccs.c
> > > +++ b/tests/intel/xe_ccs.c
> > > @@ -162,8 +162,24 @@ static void surf_copy(int xe,
> > >   						      (void *)mid->ptr, mid->size);
> > >   		munmap(ccsmap2, ccssize);
> > > -		igt_assert(!strcmp(orig, newsum));
> > > -		igt_assert(!strcmp(orig2, newsum2));
> > > +		if (blt_platform_has_flat_ccs_enabled(xe)) {
> > > +			if (IS_GEN(xe, 12) && is_intel_dgfx(xe)) {
> > > +				igt_assert(!strcmp(orig, newsum));
> > > +				igt_assert(!strcmp(orig2, newsum2));
> > > +			} else if (AT_LEAST_GEN(xe, 20)) {
> > > +				if (is_intel_dgfx(xe)) {
> > > +					/* buffer object would become
> > > +					 * uncompressed in xe2+ dgfx
> > > +					 */
> > > +					igt_assert(!blt_surface_is_compressed(xe, ctx,
> > > +							NULL, ahnd, mid));
> > > +				} else {
> > > +					/* ccs should be present in xe2+ igfx */
> > > +					igt_assert(blt_surface_is_compressed(xe, ctx,
> > > +							NULL, ahnd, mid));
> > > +				}
> > > +			}
> > > +		}
> > This part is fine for me, but below code doesn't work on Xe2/discrete.
> > I mean I got:
> > 
> > (xe_ccs:6919) CRITICAL: Test assertion failure function surf_copy, file ../tests/intel/xe_ccs.c:232:
> > (xe_ccs:6919) CRITICAL: Failed assertion: result == 0
> > (xe_ccs:6919) CRITICAL: Source and destination surfaces are different after restoring source ccs data
> > 
> > After resume we put corrupted, then previous ccs data. In all cases
> > along with uncompressed surface this leads to disaster. I mean for
> > discrete instead putting original ccs data (this one extracted before
> > suspend) you should fill it with zeros. Original ccs data were fine
> > before suspend migrated surface to system memory, but after resume
> > those ccs data are not valid anymore.
> > 
> > I've verified that for Xe2/discrete:
> > 
> > 	/* retrieve back ccs */
> > 	/* memcpy(ccsmap, ccscopy, ccssize); */
> > 	memset(ccsmap, 0, ccssize);
> > 
> > does last blit work correctly.
> > 
> > --
> > Zbigniew
> I see. But doing memset() would fail for ctrl-surf-copy subtest since the
> mid blt object would be compressed all along.
> So, we need to copy the original ccs data to the mid blt object to copy it
> correctly to dst blt object.
> 
> So, we need to call memset() only in case of suspend-resume.

Right, only on suspend-resume subtest on Xe2/discrete. Other
platforms should have ccs data intact.

--
Zbigniew

> 
> Best,
> Akshata
> 
> > >   		g_free(orig);
> > >   		g_free(orig2);
> > >   		g_free(newsum);
> > > @@ -193,7 +209,8 @@ static void surf_copy(int xe,
> > >   	intel_ctx_xe_sync(ctx, true);
> > >   	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
> > >   	result = memcmp(src->ptr, dst->ptr, src->size);
> > > -	igt_assert(result != 0);
> > > +	if (!blt_platform_has_flat_ccs_enabled(xe))
> > > +		igt_assert(result != 0);
> > >   	/* retrieve back ccs */
> > >   	memcpy(ccsmap, ccscopy, ccssize);
> > > @@ -365,7 +382,8 @@ static void block_copy(int xe,
> > >   	 * occurs and ctrl surface will be filled with some not-zeroed values.
> > >   	 */
> > >   	if (mid->compression && FROM_EXP_WH(width, height))
> > > -		igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
> > > +		if (!blt_platform_has_flat_ccs_enabled(xe))
> > > +			igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
> > >   	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
> > > -- 
> > > 2.34.1
> > > 
