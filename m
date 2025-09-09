Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40A9CAC583
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 10:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7264210E697;
	Tue,  9 Sep 2025 10:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ow6wVSWq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6644F10E697
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 10:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757414530; x=1788950530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3kkA8Lml2iWbBVS1btga+IiKep1d/L+GSdKLIRzUAXQ=;
 b=Ow6wVSWqnsPObVoX8KQ8zqKH9nKr0bTvnXvVEZlERFCXs46wZmqQbmnz
 3sg8hcyxgMR1x/YdU7iqjMhUiuJlS1ZNikgQEDvSDPZtpF30NwXXbFbL1
 OAvS3+6oGadyztxi93frHgEnn8NZLouFODMV8PDtKqRtBtoAmYoqgvNyO
 8csFYYvDdAI2TqRq5bAk02vesWBhjp6yflci9y2VanHYp0aN5q/esd0Ww
 ZR3OF2uZUOxCYaBafBtwDSd6ObNtU485o79vu12xtR5qyvkjetrMbSyKn
 7l/E7/wRSNrbNGM3ddL1MWNie59P+4lAEzVydQhO0Ixf8bq4VN7wOrU8D g==;
X-CSE-ConnectionGUID: TaAVc8suRBirhJnMFKQhrQ==
X-CSE-MsgGUID: abOTw8rYRR6IfyNK3GmAlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58733990"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="58733990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 03:42:09 -0700
X-CSE-ConnectionGUID: BML/DkErRE+jENJGHbHzSQ==
X-CSE-MsgGUID: 2oZaaLIkQR2o5Y9gWGzmfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172971363"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.82])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 03:42:08 -0700
Date: Tue, 9 Sep 2025 12:42:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_ccs: stop using l3 enabled PAT index
Message-ID: <nqt3qgdbclbjojgrv6y6xsndxevjsp7o5wdwtm7exbsjk7nffk@sinz74mmf353>
References: <20250908182045.66769-2-matthew.auld@intel.com>
 <obup452b5kpktfxhgadbzrcviy3mtlq6tpttzluz2ztmnkurfn@5o6xnpf7iiml>
 <08b08315-ebc5-4e1e-8f73-e22e9ed24684@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08b08315-ebc5-4e1e-8f73-e22e9ed24684@intel.com>
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

On Tue, Sep 09, 2025 at 10:23:00AM +0100, Matthew Auld wrote:
> On 09/09/2025 08:23, Zbigniew Kempczyński wrote:
> > On Mon, Sep 08, 2025 at 07:20:46PM +0100, Matthew Auld wrote:
> > > When populating the fb using an l3 compression enabled PAT index some or
> > > all of the data may end up cached. However the HW looks to only perform
> > > the compression step in this case upon evicting those entries, when also
> > > trying to write them back to VRAM. This seems to be the cause of this
> > > test randomly failing on BMG with the CCS state appearing to sometimes
> > > be zeroed even after doing a compression enabled copy. From
> > > experimentation adding a sleep before the surface copy cures the
> > > failure, which fits since this will give plenty of time to enter rc6
> > > which will indirectly also nuke the l3.  Grabbing a forcewake around the
> > > sleep brings back the failure which also makes sense since this will
> > > inhibit the flush and also rules out missing synchronisation hidden by
> > > the sleep. Using a large fb also cures the issue, which also fits since
> > > the fb will now be larger than the entire l3, so some data will have to
> > > be compressed when evicted.
> > > 
> > > To fix this don't use an l3 enabled PAT index prior to taking a snapshot
> > > of the raw CCS state. Probably this also means the test is maybe too
> > > much looking at implementation details, by assuming that zeroed CCS
> > > state must also imply that there is no compression, even if compression
> > > is merely delayed until the data is evicted.
> > 
> > Display is reading directly from vram, so IIUC at moment of scanout
> > to properly decompress fb it should have an access to flushed surface
> 
> Right, it might be that some modes allow scanout with compression so it
> might also be able to read CCS, so no need to decompress, but not completely
> sure.
> 
> > and its CCS data, am I right? Blit to WT surface with delayed flush of
> > CCS data creates such race - WT surface is flushed, but CCS is not.
> 
> I don't think it's a delayed flush of CCS, but rather the compressor stage
> is delayed until actually writing data to VRAM. At the point of writing to
> VRAM I guess the compressor makes the decision on whether to write to CSS or
> VRAM, depending on whether stuff is compressible? So if you peek at the CCS
> state too early you might not see it in some cases. I think that makes
> sense?
> 
> Also I'm not sure if the WT thing actually works as expected, since the WT
> seems to only apply to l4, and not l3, according to BSpec, but AFAIK there
> is no l4 on BMG. So I think index 15 and 11 are perhaps the same on BMG?
> 
> > What causes access_flat_ccs_surface() called before cache flush is a
> > problem and there's no problem with scanout? For me access (regardless
> > surf-copy or scanout) looks similar, only timing may vary.
> 
> Right, display is not coherent (goes directly to VRAM) so you can't use
> standard l3 caching, but you can use l3:xd, which is the transient display
> version, and those special cache entries will be flushed by KMD when doing
> the display flip, so before the scanout happens. And flushing/evicting looks
> to trigger compression as needed, if cached.
> 
> So for scanout there is an existing transient flush to handle l3:xd, but for
> access_flat_ccs_surface(), there is no guaranteed flush anywhere, unless you
> get "lucky" with rc6, or the fb is somehow larger than the l2, in which you
> should be guaranteed to see at least some compression, since something will
> have to get evicted.

Right, at this point we can't control whether WT flush will happen,
so we might access stale CCS data.

So for your change:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


> 
> > 
> > I don't understand why WT in this case causes delayed CCS flush,
> > where UC_COMP is not. Does UC_COMP applies to CCS data as well?
> > 
> > --
> > Zbigniew
> > 
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5941
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5376
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > ---
> > >   tests/intel/kms_ccs.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> > > index cb0c80f03..ab081aa75 100644
> > > --- a/tests/intel/kms_ccs.c
> > > +++ b/tests/intel/kms_ccs.c
> > > @@ -812,7 +812,7 @@ static struct igt_fb *get_fb(data_t *data, u64 modifier, double r, double g,
> > >   		fb = get_fb(data, modifier, r, g, b, width, height,
> > >   			    data->format);
> > > -		igt_xe2_blit_with_dst_pat(fb, temp_fb, intel_get_pat_idx_wt(fb->fd));
> > > +		igt_xe2_blit_with_dst_pat(fb, temp_fb, intel_get_pat_idx_uc_comp(fb->fd));
> > >   		access_flat_ccs_surface(fb, true);
> > >   		return fb;
> > > -- 
> > > 2.51.0
> > > 
> 
