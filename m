Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0B3C48BC3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 17:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C45D10E013;
	Mon, 19 Feb 2024 17:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJY/DTtl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9511110E013
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 17:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708363063; x=1739899063;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iR7b9F6TkFRPnyf0AnKo/YDR8uJG9UcNdbUp3UccexM=;
 b=RJY/DTtljETSPANP+lW3Rf4wMsh9c6aJmMRtN2xjmb6uUZ+KBU0od1nT
 S0rq1gFDFu2kR658OFCTdQrI2FEBdroKs9X95f1OiWOC/kU4TQFEvI6GS
 unOTbeE1YH160jzsMcgpenonOdNduwxbu5dzWIhO5MxzhOKoU/fv11jUu
 k77be5gCbJ8d3ZcAbclRLjdXMRuHZ3Z3E9GbX/cPstxsA8/Vibsox7hlD
 QWwb/MKqCFSRW+80/3I/GGSTBO2D8KLSc9DkOePMfD9EccWKGvy+RP1Mz
 VrZpGPwI57tRvz5ST+SaO7CsbUEwZVlqMhNiEyFKwDDh34KIJzxom3Huo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13159987"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="13159987"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 09:17:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="9238487"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 09:17:39 -0800
Date: Mon, 19 Feb 2024 18:17:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH i-g-t v4] lib/drmtest: drop legacy check from filtered
 opens
Message-ID: <20240219171735.aazot74qddrcys5o@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20240216190534.79086-1-kamil.konieczny@linux.intel.com>
 <18984149.jiFIW2sfyF@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18984149.jiFIW2sfyF@jkrzyszt-mobl2.ger.corp.intel.com>
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

Hi igt-dev,
On 2024-02-19 at 10:22:25 +0100, Janusz Krzysztofik wrote:
> Hi Kamil,
> 
> On Friday, 16 February 2024 20:05:34 CET Kamil Konieczny wrote:
> > For some multi-GPU tests user can check them on single-GPU board
> > with the help of repeating same card in --device option or
> > environment var IGT_DEVICE:
> > 
> > sudo IGT_DEVICE=pci:vendor=Intel,card=0\;pci:vendor=Intel,card=0 \
> > 	build/tests/gem_basic --r multigpu-create-close
> > 
> > but is unable to use it due to current implementation of device
> > opening in function __drm_open_driver_another().
> > 
> > To allow this drop legacy check for already opened device when
> > using filters.
> > 
> > v2: improving description, using filtered_count var (Janusz)
> >   changing drmtest: to lib/drmtest: (Kamil)
> >   adding Lukasz Laguna to Cc: (Kamil)
> > v3: for out-of-bound index print debug, not a warning (Kamil)
> > v4: restored using filters number for filtered path and restored
> >   setting opened fds for legacy tests, changed description (Kamil)
> > 
> > Cc: Arkadiusz Hiler <arek@hiler.eu>
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> > Cc: Petri Latvala <adrinael@adrinael.net>
> > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Reviewed-by: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > ---
> >  lib/drmtest.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> > 
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 52b5a2020..43e6c0158 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -481,13 +481,12 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
> >   *
> >   * This function opens device in the following order:
> >   *
> > - * 1. when --device arguments are present:
> > + * 1. when --device arguments are present or IGT_DEVICE env var is used:
> >   *   * device scanning is executed,
> >   *   * idx-th filter (starting with 0, filters are semicolon separated) is used
> >   *   * if there is no idx-th filter, goto 2
> >   *   * first device maching the filter is selected
> > - *   * if it's already opened (for indexes = 0..idx-1) we fail with -1
> > - *   * otherwise open the device and return the fd
> > + *   * open the device and return the fd
> >   *
> >   * 2. compatibility mode - open the first DRM device we can find that is not
> >   *    already opened for indexes 0..idx-1, searching up to 16 device nodes
> > @@ -526,12 +525,19 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
> >   */
> >  int __drm_open_driver_another(int idx, int chipset)
> >  {
> > +	int filter_count = igt_device_filter_count();
> >  	int fd = -1;
> >  
> > -	if (chipset != DRIVER_VGEM && igt_device_filter_count() > idx) {
> > +	if (chipset != DRIVER_VGEM && idx < filter_count) {
> >  		struct igt_device_card card;
> >  		bool found;
> >  
> > +		if (idx < 0) {
> > +			igt_debug("Cannot open, index out of bounds: %d, filter_count=%d\n",
> > +				 idx, filter_count);
> > +			return -1;
> > +		}
> 
> I'm wondering why we need this check now while it was not here before.  Is 
> that really related to dropping the call to _is_already_opened() below?  If 
> idx < 0 then in any case that seems to be a bug on the caller side.
> 
> I think the most clean approach would be to declare the idx argument as 
> unsigned int.  If not then I would place this check at the top of the function 
> body, above the if block, and use something more strong than igt_debug() 
> (igt_fail() if we may expect users to be prepared for long jumps, igt_warn() 
> otherwise).
> 
> How about moving that to a separate patch?  If not than maybe a "while being 
> at it" note in commit description would be sufficient.
> 
> Thanks,
> Janusz
> 

You are right, I will remove it - for negative idx it will enter
filtered path and there filter with return NULL - so no need to
check for it.

Regards,
Kamil

> > +
> >  		found = __get_card_for_nth_filter(idx, &card);
> >  
> >  		if (!found) {
> > @@ -542,8 +548,6 @@ int __drm_open_driver_another(int idx, int chipset)
> >  		if (!found || !strlen(card.card))
> >  			igt_warn("No card matches the filter! [%s]\n",
> >  				 igt_device_filter_get(idx));
> > -		else if (_is_already_opened(card.card, idx))
> > -			igt_warn("card maching filter %d is already opened\n", idx);
> >  		else
> >  			fd = __open_driver_exact(card.card, chipset);
> >  
> > 
> 
> 
> 
> 
