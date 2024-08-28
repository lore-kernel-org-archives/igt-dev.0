Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3A8C54FAD
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 13:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0EB10E50C;
	Wed, 28 Aug 2024 13:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COw1G5ek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6695D10E50C
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724850229; x=1756386229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PvTicYLrMZd91S5Sg2q4BSBVByd1PsXrvhIAEOHxKbs=;
 b=COw1G5ekvWVIl4oYa77mMj6zfQy4fYZfCf4FB1izaymi0/huesXuDu2C
 BTjJyoO7ScmARnAxZYf42SdI0QijoYH+2+fW6CiqFoYH/nudbdNS0l6xi
 fiQvaW2JVTUif+Xg+QTQtbdSLKHHGCXhlRh3PoT1BLm4EHy9l9BcAN53Y
 svvXF0C3ny4MBEppyhDGdof8NBZl4uTGdBRrKBoNBIAqRh8H3xUD+Jaue
 pPr2g9RFgKb5yHYwHVloOO9qHaAw2JK4yogLo/V4CHmiTMuItmID6bhHO
 59xqXzk89jdIK0F7Yjte3O+tXC3rQ0Y0N2K6ySXJR21WLkqxeNxHqcyvL w==;
X-CSE-ConnectionGUID: PLR37ICIR761Q0fIBPNdhg==
X-CSE-MsgGUID: BAQjWS6FQJ6UomowXgk5Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34533831"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="34533831"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 06:03:49 -0700
X-CSE-ConnectionGUID: /6D6XCrGQDiwfbSQpT4Klw==
X-CSE-MsgGUID: szN1nipRTkmDiZg2dyEzfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="63199426"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 28 Aug 2024 06:03:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 28 Aug 2024 16:03:45 +0300
Date: Wed, 28 Aug 2024 16:03:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 "Lobo, Melanie" <melanie.lobo@intel.com>
Subject: Re: [PATCH i-g-t 01/37] lib/intel_aux_pgtable: Library to add
 support for RGB16161616_64B format
Message-ID: <Zs8gMbmpCyYm74OB@intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-2-ville.syrjala@linux.intel.com>
 <45e652e0-0fc6-41ad-bc61-cd70b58169ca@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45e652e0-0fc6-41ad-bc61-cd70b58169ca@gmail.com>
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

On Tue, Aug 27, 2024 at 06:16:20PM +0300, Juha-Pekka Heikkila wrote:
> On 3.7.2024 2.27, Ville Syrjala wrote:
> > From: Melanie Lobo <melanie.lobo@intel.com>
> > 
> > TGL+ supports RGB16161616_64B FP16 format which is a binary
> > floating-point computer number format that occupies 16 bits
> > in computer memory.
> > 
> > This was tested with kernel patch,
> > https://patchwork.freedesktop.org/series/124957/
> > https://lore.kernel.org/all/20231201091133.23508-1-melanie.lobo@intel.com/
> > 
> > cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > cc: Swati Sharma <swati2.sharma@intel.com>
> > Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
> > [vsyrjala: s/0x1/0x10/ to make the format correct, note that it's for TGL+]
> 
> I'm feeling bit challenged on this s/0x1/0x10/ change. When looking at 
> bpsec 43868 Melanie's original '1' look correct. Rest of those 
> AUX_FORMAT_* match to what's in 43868.

That's for media compression it seems. We need render compression.

> Then with bspec 43869 this '10' 

That page seems to be just for ATS/etc. For TGL we need 
want 53911 and for DG2+ 53726. Which give us 0x10 and 0x5
respectively.

> look correct but what will we get on MTL with this? > I think Melanie's 
> original kernel change was targeting for MTL hence this was not looked at.

For DG2+ 44930 says:
"Compression format from AUX page walk is ignored. Instead compression
 format from Surface State is used."
which presumably was changed for flat CCS, but bspec seems to be
telling us that MTL already includes this change despite not having
flat CCS yet.

Though the tags on that page are somehow screwed up because if I filter
for MTL the whole page gets disabled. I filed an issue for that.

Anyways, should be fairly easy to confirm by putting garbage into
the AUX page table compression format on MTL vs. TGL and seeing what
happens.

And if everything checks out we should perhaps explicitly not populate
the AUX page table compression format on MTL, just to avoid confusing
people (bspec itself is already confusing enough when it comes to
compression).

> 
> /Juha-Pekka
> 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >   lib/intel_aux_pgtable.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> > index 3cbb0e26f35c..8ff48641619e 100644
> > --- a/lib/intel_aux_pgtable.c
> > +++ b/lib/intel_aux_pgtable.c
> > @@ -22,6 +22,7 @@
> >   #define AUX_FORMAT_AYUV		0x09
> >   #define AUX_FORMAT_ARGB_8B	0x0A
> >   #define AUX_FORMAT_NV12_21	0x0F
> > +#define AUX_FORMAT_RGBA16_FLOAT	0x10
> >   
> >   struct pgtable_level_desc {
> >   	int idx_shift;
> > @@ -306,6 +307,10 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
> >   			entry.e.format = AUX_FORMAT_ARGB_8B;
> >   			entry.e.depth = bpp_to_depth_val(32);
> >   			break;
> > +		case 64:
> > +			entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
> > +			entry.e.depth = bpp_to_depth_val(64);
> > +			break;
> >   		default:
> >   			igt_assert(0);
> >   		}

-- 
Ville Syrjälä
Intel
