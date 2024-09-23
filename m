Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EAACF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 20:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D48810E498;
	Mon, 23 Sep 2024 20:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MarDJCS/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D2810E498
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 20:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727121861; x=1758657861;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zHvxKl1m4PSWaU3YuBLzasHdORq9k1g0gbaCB4HCHcQ=;
 b=MarDJCS/cNJlmEZ7PZ/vOFuQ5VUVqjoXMxOKpr7GovrpHXCpp5WbnmRS
 PVBYeQDwp/NAqAruRPun2PFy/HrZyOm80uZJz330QbADEqdxbyO5ZrjBj
 49bwGpJUwX4Hc0qm6vExEL/2eVnUEpFNpRQcJVuDJuQIa+BWH8J0iVHiE
 gcvBSEQDXYVc0wBOItOPQIBqg/qEzSUYaWiSctdTgTRefqCMiH/6lpBAo
 1AF1A48mFZjS4Ytp5vTs6GEiDLYRlTeD2QWESaPZxT+5hjj2Hj/GiDp/s
 xnKY752XRwCIp1M4/fs++S79GZNaxdqMIROt4UR4LY+kUs4L5eDE2AcGb w==;
X-CSE-ConnectionGUID: oS1x72n/TzKJSLxhTMMSYQ==
X-CSE-MsgGUID: Ut4pn1VnQpCe1+eKEeUJKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43607245"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="43607245"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:04:20 -0700
X-CSE-ConnectionGUID: i8N9u/1tSo2w2BjjAtAhcA==
X-CSE-MsgGUID: FhGotTyqRumr4ks6Fu5x+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71317238"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 13:04:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 23:04:17 +0300
Date: Mon, 23 Sep 2024 23:04:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 05/18] lib/rendercopy: Skip AUX surface setup in
 TGL+
Message-ID: <ZvHJwc1wOVLb83Ef@intel.com>
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
 <20240918120518.30258-6-ville.syrjala@linux.intel.com>
 <94856692-658b-4ff6-80b1-261863fd1d95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94856692-658b-4ff6-80b1-261863fd1d95@gmail.com>
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

On Mon, Sep 23, 2024 at 12:51:53PM +0300, Juha-Pekka Heikkila wrote:
> Took a while to realize why this didn't break anything but since hw 
> agree it's all ok. I wonder if on the changed line this check
> "buf->ccs[0].stride" is really needed, I think that happen only with 
> flatccs which doesn't exist on <gen12

Hmm. The code populating that seems quite dodgy. I can't even
figure out what it ends up doing. I'll see if I can fix it to
make sense.

I think the correct rules should be:
- clear color should not be part of ccs[], currently 
  flat ccs platforms seem to violate that
- flat ccs platforms don't need ccs[], but again we
  seem to put nonsense there for those

> 
> Anyway,
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> On 18.9.2024 15.05, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > On TGL+ the AUX stuff is handled via the magic AUX pagetables.
> > Mesa code tells me that the hardware only uses that the
> > SURFACE_STATE AUX stuff for MCS, which is of no interest to us.
> > So just skip the AUX setup in SURFACE_STATE.
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >   lib/rendercopy_gen9.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> > index b33e7fc9feba..719307e6f45b 100644
> > --- a/lib/rendercopy_gen9.c
> > +++ b/lib/rendercopy_gen9.c
> > @@ -261,8 +261,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> >   		else
> >   			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
> >   
> > -		if (buf->ccs[0].stride) {
> > -
> > +		if (intel_gen(ibb->devid) < 12 && buf->ccs[0].stride) {
> >   			ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
> >   
> >   			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,

-- 
Ville Syrjälä
Intel
