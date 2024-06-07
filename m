Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BE1C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 14:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DC210E010;
	Fri,  7 Jun 2024 14:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bW4YUZTc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7F710E010
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717771204; x=1749307204;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=I2pBnZjA/9rcdXpah3+qMMzgcidqMqmzupyxeVTFUYs=;
 b=bW4YUZTcvEKjEtc3p4PjFyhYoGKFeSQRq9yvxXnq15kvn0tfzYXR9Aur
 UKKtAdmiFM5xV8Ae8ffeUga4fNaFZrGc3t4e4dEe2yY+KBlm4fGFyhSLi
 FZddeK8CNqYw7P19v4GnvEWc/3KBWKz5Q1HhU+uNBSGsfHxJ4nX41tnMG
 uI67fzuWmIEoOYPVY9cJeLc+qjS5NzFnA23Sq63zte7l8AmvTnCGp/m2A
 qwuMvrskCdMqm6lSZFR9mxA3/9YFOpybhlwJEuy/HiW0++VjjNMGfA8t4
 X6SHUrkZCfGc3Ja6XlDwBV60SsIduhbjEJUL+4P3XFZ2Aa4upAlOi7olM w==;
X-CSE-ConnectionGUID: y3T/woVJSIWKZ0NkyLsGgw==
X-CSE-MsgGUID: YWkxX8BBS7O9oN5C6OMInw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14627444"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14627444"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:40:03 -0700
X-CSE-ConnectionGUID: jAPvYOLKS0SGB2yrtuIzNw==
X-CSE-MsgGUID: bf0M2uJIQB+QxTge6G80Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38272066"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 07:40:01 -0700
Date: Fri, 7 Jun 2024 16:39:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luca@coelho.fi>, Luca Coelho <luciano.coelho@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel: check drmModeGetConnector()
 return in i915_pm_rpm
Message-ID: <20240607143958.nx3qvnjerpyjmmuc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Luca Coelho <luca@coelho.fi>,
 Luca Coelho <luciano.coelho@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240528075855.463729-1-luciano.coelho@intel.com>
 <20240528075855.463729-3-luciano.coelho@intel.com>
 <20240529163744.3tkyh44fcgjsxxy4@kamilkon-DESK.igk.intel.com>
 <2d94493d7f2827c0e5d5536ef46066b72346d3b7.camel@coelho.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d94493d7f2827c0e5d5536ef46066b72346d3b7.camel@coelho.fi>
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

Hi Luca,
On 2024-05-30 at 00:45:12 +0300, Luca Coelho wrote:
> On Wed, 2024-05-29 at 18:37 +0200, Kamil Konieczny wrote:
> > Hi Luca,
> > On 2024-05-28 at 10:58:55 +0300, Luca Coelho wrote:
> > 
> > this subject imho is too long:
> > 
> > [PATCH i-g-t v2 2/2] tests/intel: check drmModeGetConnector() return in i915_pm_rpm
> > 
> > It should have test name at begin, not at end:
> > 
> > tests/intel/i915_pm_rpm: Fix bug in init_mode_set_data()
> > 
> > or
> > 
> > tests/intel/i915_pm_rpm: check drmModeGetConnector() before use
> > 
> > or find out something better.
> 
> This is the same as in the previous patch.  So, just tell me which one
> of your options you want me to use and I'll do it.  No need to bike-
> shed on this here.
> 
> 
> > > The drmModeGetConnector() function can return NULL in some cases, so
> > > we need to check the return value before accessing it.  This is not
> > > being checked in init_mode_set_data(), so fix that.
> > 
> > Please cite few lines from bug report:
> > 
> > Starting subtest: module-reload
> > Received signal SIGSEGV.
> > Stack trace: 
> > #0 [fatal_sig_handler+0x10f]
> > #1 [killpg+0x40]
> > #2 [setup_environment+0x33f]
> 
> This is one click away, in the link I added below, but I see the

It is better to give such info here in patch itself,
especially as this is needed for reproduction.

Regards,
Kamil

> potential usefulness to copy it here.  It could make it easier to find
> patches that fix bugs in specific tests, if you use git grep, for
> instance.  Though I'm in general of the opinion that duplicating
> information that is already linked in one way or another.
> 
> But sure, I'll add it. :)
> 
> 
> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > Add here also some KMS devs to Cc, I added Jani, Juha-Pekka and Bhanuprakash.
> > 
> > Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > Cc: Jani Saarinen <jani.saarinen@intel.com>
> > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> Okay. :)
> 
> Do you have something like the kernel's get_maintainer.pl script?
> Otherwise it's hard to know who should be justifiably spammed. ;)
> 
> 
> > > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > > ---
> > >  tests/intel/i915_pm_rpm.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> > > index 0ea5fbd8afd9..3b4034f24a57 100644
> > > --- a/tests/intel/i915_pm_rpm.c
> > > +++ b/tests/intel/i915_pm_rpm.c
> > > @@ -515,6 +515,12 @@ static void init_mode_set_data(struct mode_set_data *data)
> > >  			data->connectors[i] =
> > >  				drmModeGetConnector(drm_fd,
> > >  						    data->res->connectors[i]);
> > > +			if (!data->connectors[i]) {
> > 
> > imho we should also check it later before using this or edids[]
> > so maybe this should really be a warn? Or even igt_assert? Or maybe
> > we should lower number of available connectors? Please ask KMS devs
> > for possible solution here.
> 
> There probably are other places where this could be a problem, for
> sure.  But I'm fixing a specific bug and maybe other changes should be
> in separate patches? I actually checked all the places where
> drmModeGetConnector() is called and only this part and the one in
> chamelium code had to be changed.
> 
> I did discuss this with the kernel display driver team, I'm part of it
> after all. ;) The driver can't guarantee the validity of a connector
> returned in the list when we call drmModeGetConnector(), because it can
> be disconnected at any time an return NULL.  Another option we
> considered was to simply restart the test silently (or at least get the
> list of connector IDs again), because this happens because of race
> conditions.  But at this stage, I wanted a fix to prevent a crash, not
> a full refactor of the test case.
> 
> One of my goals was to change the test as little as possible.  Without
> my change, if this happened, the test would just crash.  I originally
> made it warn, which, like the crash, would cause the test to fail,
> making it visible.  But you asked me to change it to igt_debug(), so I
> did.
> 
> 
> > Above code should work if you also fix fini_mode_set_data() below
> > and also at one more function:
> > 
> > grep -n count_connectors tests/intel/i915_pm_rpm.c
> > 
> > 319:    for (int i = 0; i < data->res->count_connectors; i++) {
> > 513:            igt_assert(data->res->count_connectors <= MAX_CONNECTORS);
> > 514:            for (int i = 0; i < data->res->count_connectors; i++) {
> > 531:            for (int i = 0; i < data->res->count_connectors; i++) {
> 
> I don't think the checks should be where count_connectors is used, but
> in the functions that may fail if the connector is (or becomse)
> invalid.  That's where the crash can happen if we assume it returns a
> valid pointer and not NULL.
> 
> --
> Cheers,
> Luca.
