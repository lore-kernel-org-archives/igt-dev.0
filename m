Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B93FCD3420
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 12:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBF3897FF;
	Tue,  3 Sep 2024 12:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DR6Yhgl0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4459C897FF
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 12:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725365030; x=1756901030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AmqEZc97/Zkutba8W89WoKU9HC1DB0GCkso9FmXQ1fE=;
 b=DR6Yhgl0JQUU14Rk81Bcrax053ZN7o8194eKehu/4IcZdk984ylfprg0
 fpUx8Z3taMHARvnvYx7Zt77v1NS2WVDIyZFlsOcrWre1H5DApDMT5G+H+
 KIzYBfzzfxVxkxcAl41IZ+nQ9GhBrpjNTRps3/8F321ZBDGGBFfPB7mnp
 zLMFdeb0k7zkFe/dwbK9iLpG7RzK42/6XOtTmgD6ea06FgWc+3KlpvNoO
 IfLWAux2WY0iSot7vRRk1E5BrMFDPBZe/eEd+Hq9kbhGNPaoIA4fhG3A3
 HMqzIteiaKILQjnhatYDcnrlJZKptPOA5NtWlNxlyrnn+DgXPKuX2IZXH g==;
X-CSE-ConnectionGUID: yfMvFKoyQMeznulfFTr5dA==
X-CSE-MsgGUID: V/1bI1jAQDODjNAB/cP3kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24096640"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="24096640"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 05:03:49 -0700
X-CSE-ConnectionGUID: RLdGLpckRHK+mP2X1v58mA==
X-CSE-MsgGUID: e+49U6VbTFinW8SK6DVLIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="65619612"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 05:03:48 -0700
Date: Tue, 3 Sep 2024 14:03:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krishnaiah Bommu <krishnaiah.bommu@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] tests/core_setmaster: Handle the test even if cards are
 non-continuous
Message-ID: <20240903120335.2yz3ix6rezxn7x53@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Krishnaiah Bommu <krishnaiah.bommu@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
References: <20240812052443.12856-1-krishnaiah.bommu@intel.com>
 <20240822164627.byk7ffdpjwpwb5tw@kamilkon-DESK.igk.intel.com>
 <DM4PR11MB529380A7C3015E03F8D1B59C9D932@DM4PR11MB5293.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB529380A7C3015E03F8D1B59C9D932@DM4PR11MB5293.namprd11.prod.outlook.com>
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

Hi Bommu,,
On 2024-09-03 at 08:32:00 +0000, Bommu, Krishnaiah wrote:
> 
> 
> > -----Original Message-----
> > From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Sent: Thursday, August 22, 2024 10:16 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Emil Velikov
> > <emil.l.velikov@gmail.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>
> > Subject: Re: [PATCH] tests/core_setmaster: Handle the test even if cards are
> > non-continuous
> > 
> > Hi Bommu,
> > On 2024-08-12 at 10:54:43 +0530, Bommu Krishnaiah wrote:
> > > Although most of userspace assumes drm cards to be populated
> > > continously,
> > >
> > 
> > Remove blank line.
> I will remove 
> > 
> > > this assumption may not be always true. After hot unpluging and
> > > repluging of card
> > >
> > 
> > Remove blank.
> I will remove
> > 
> > > the card may be non-continous.  To address such scenarios where the
> > > cards can be non-continous
> > >
> > 
> > Remove blank.
> I will remove
> > 
> > > modify the tweak_perm function to loop all possible
> > > cardnumbers(card0-card255) to confirm are they populated or not.
> > -----^
> > s/cardnumbers/card numbers/
> I will changes 
> > 
> > imho test is checking only first card so looping all is not optimal.
> > 
> > >
> > > Problem Description:
> > > The test fails after running the `core_hotunplug@hot*` subtest, where
> > > card0 is missing.
> Here card0 is populated as card1
> > 
> > imho this could be discussed if that is ok or driver error, imho valid case would
> > be to have multi-card and unpluging first.
> > 
> > > This leads to a failure in the subsequent `master-drop-set-user` test.
> > >
> > > Command sequence for reproducing the issue:
> > > - Check available cards: `ls /dev/dri/`
> > > 	- Output: by-path  card0  renderD128
> > > - Run the test: `# ./core_hotunplug --r hotrebind-lateclose`
> > > - Check again: ‘ls /dev/dri/’
> > > 	- Output after failure: by-path  card1  renderD129
> > 
> > s/failure/core_hotunplug failure/
> I will change 
> > 
> > > - Run the test: `# ./core_setmaster --r master-drop-set-user`
> > >
> > > This failures on both XE and i915 for above sequence.
> > >
> > > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > > Cc: Emil Velikov <emil.l.velikov@gmail.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > ---
> > >  tests/core_setmaster.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c index
> > > 9c2083f66..a2758e2f2 100644
> > > --- a/tests/core_setmaster.c
> > > +++ b/tests/core_setmaster.c
> > > @@ -116,9 +116,10 @@ static unsigned tweak_perm(uint8_t *saved_perm,
> > unsigned max_perm, bool save)
> > >  	for (i = 0; i < max_perm; i++) {
> > >  		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
> > >
> > > -		/* Existing userspace assumes there's no gaps, do the same. */
> > > +		/* Userspace cannot always have continuous card0...N due to
> > > +		 * dynamic unloading or removal of cards */
> > >  		if (stat(path, &st) != 0)
> > > -			break;
> > > +			continue;
> > 
> > imho this is ok but you should also break after first save/restore just before end
> > of for loop, so no need for setting all perms when you will test only first one.
> > 
> > Also imho you should fill info in saved_perm about which card was found and
> > use it instead of calling __drm_open_driver().
> > 
> 
> kbommu@kbommu-desk:~/xe_public/igt-gpu-tools$ git diff
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index a2758e2f2..b0bf4a5d3 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -138,6 +138,9 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
>                  * failure may be irrelevant.
>                  */
>                 chmod(path, st.st_mode);

Just noticed a problem here, return code for chmod() is not checked...

> +
> +               if (save)
> +                       return i;

It should also apply for restoring, not only setting.
Imho also save an index at which you found a card for testing
so you could restore it later and also use it for opening for
testing.

Regards,
Kamil

>         }
>         return i;
>  }
> kbommu@kbommu-desk:~/xe_public/igt-gpu-tools$
> 
> this is the changes your excepting right ?
> 
> Regards,
> Krishna.
> 
> > Regards,
> > Kamil
> > 
> > >
> > >  		if (save) {
> > >  			/* Save and toggle */
> > > --
> > > 2.25.1
> > >
