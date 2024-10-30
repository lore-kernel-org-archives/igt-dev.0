Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B159D6B6B7
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 17:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC79F10E3E9;
	Wed, 30 Oct 2024 17:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7k7eYML";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADC310E3E9
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730308440; x=1761844440;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EE7/a17J8vmkeqodo8lPMI9SBzyC68wNCCTvzLaJY9E=;
 b=A7k7eYMLu0HKf5AsShxPnFSSfmaNGl46YaS4YAX5ytpb3nNtYPez1zH9
 zE++8ABxnPc0TMqV7oZnjyAVoI3iKlVsgW//IcGzXIcHNtfuXftIvpxUO
 kbwzZ37+o9alcv+VNkgCzX51HUyYniJ1k8558kcTLFi/lKC/1kGiTVH5S
 XPt8DiMq/67L4csrdfeQ2furtFDIYSv5Uq5mAMtY874/zQrbsUWQcH2te
 cdV233Scf+51pn1coNbnwUCH0XIvfmAOxSNXL+ai0JIGWCWNBbGxv5J6N
 LvrlBsyVjrliYfImmsBhZyKdvkcrUrwBGpS6pj8+OXXmtUDWqEHkJbT0N A==;
X-CSE-ConnectionGUID: lQN6OJFYT2WYoutARHgMOw==
X-CSE-MsgGUID: s/Pvd9i6TsC4N9GpPMC1Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29790603"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29790603"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 10:14:00 -0700
X-CSE-ConnectionGUID: WSX4sBrrQaKMqH4kJdFr5w==
X-CSE-MsgGUID: nFo23bwBTeqS9wfKnlc5fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="82300353"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 10:13:58 -0700
Date: Wed, 30 Oct 2024 18:13:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/xe_wedged: Ignore more dmesg
 warnings
Message-ID: <20241030171342.vqiwgwkf2qvsnr57@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
References: <20241029182259.125117-1-kamil.konieczny@linux.intel.com>
 <20241029182259.125117-2-kamil.konieczny@linux.intel.com>
 <CH0PR11MB5444DC44BFF8CE88DA1A6DEFE54B2@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB5444DC44BFF8CE88DA1A6DEFE54B2@CH0PR11MB5444.namprd11.prod.outlook.com>
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

Hi Jonathan,
On 2024-10-29 at 19:15:04 +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com> 
> Sent: Tuesday, October 29, 2024 11:23 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Subject: [PATCH i-g-t v2 1/2] tests/intel/xe_wedged: Ignore more dmesg warnings
> > 
> > There are more warnings in dmesg which should be ignored,
> > one comes from driver, for example:
> > 
> > xe 0000:00:02.0: [drm] *ERROR* GT0: reset failed (-ECANCELED)
> > xe 0000:00:02.0: [drm] *ERROR* GT1: Failed to submit gsc proxy rq (-ETIME)
> > 
> > or from drm:
> > 
> > <4> [438.651441]  ? __pfx___drm_printfn_seq_file+0x10/0x10 [drm]
> > <4> [438.651476]  ? __pfx___drm_puts_seq_file+0x10/0x10 [drm]
> > 
> > or from kernel itself:
> > 
> > <4> [226.597358] Modules linked in:
> > 
> > so extend regex with them.
> > 
> > v2: move '|' to begin of strings for better reading (Jonathan)
> >   extend regex with two more, correct __pfx___ regex (Kamil)
> >   added r-b and correcting name in Cc
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2919
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  tests/intel/xe_wedged.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> > index 88e5d47f2..123ce6396 100644
> > --- a/tests/intel/xe_wedged.c
> > +++ b/tests/intel/xe_wedged.c
> > @@ -29,7 +29,11 @@
> >  static void ignore_wedged_in_dmesg(void)
> >  {
> >  	/* this is needed for igt_runner so it will ignore it */
> > -	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged");
> > +	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> > +				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> > +				    "|GT[0-9A-Fa-f]*: Failed to submit"
> > +				    "|Modules linked in:"
> > +				    "|__pfx___drm_.*drm");
> 
> It's starting to get a little bit silly how long this ignore list is getting, but if it's necessary,
> it's necessary.
> 
> My Reviewed-by still stands.
> -Jonathan Cavitt
> 

Hmm, I see there are some problems with verification for Xe driver
after this test, after test passes or skips all others starts skip,
for example:

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt_runner0.txt

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_wedged@wedged-at-any-timeout.html

This needs more work so please do not merge it.

Regards,
Kamil

> >  }
> >  
> >  static void force_wedged(int fd)
> > -- 
> > 2.47.0
> > 
> > 
