Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCAAC27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 13:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5870D10E0AD;
	Thu, 13 Jun 2024 13:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sdq4mJGH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15F810E0AD
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 13:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718285547; x=1749821547;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1p+bv7MKaCMB2PE3OLE1+AJ9zzZgLevrmCfkWkS1+LA=;
 b=Sdq4mJGHxTzb7CTtYZXLUhXfwoWgD444xtUh+uF5DaFN9Su6lytYhrcP
 StMJghH7T8U3YWUs8RldAV9KOZ7snNIY0SYNnz/7hH7hAQmyEWH0EuRNz
 /tPpORX68o1ZtcsS9AYw4rr4LmkZCi5dXZ1ac435J8OIQz8XvIPZzUuDs
 ysNjPVnspVN7EGODWurQDSm5h5k15ZoB/dexCMyR5QfaxtY5JaMpENi4R
 aLeVbShf+eIsmfV6M6Bod3jzvva8WwjEoPEuVqMpZtZUuvwnZQ28op+7I
 nhZ7vMyMCrm5TRpvlNmaiwfFAO4OBOXCXhkpamcWNV9mkcHCJOcJyeTNO g==;
X-CSE-ConnectionGUID: heevVeKvQgWJ5M5JN0yIGQ==
X-CSE-MsgGUID: 1cWLipB/TMKUmIH8jBLr7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="26525558"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="26525558"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 06:32:27 -0700
X-CSE-ConnectionGUID: /q6esMniTc+EXZa/rwcfww==
X-CSE-MsgGUID: acPl84nnTTGo3yoof5c/Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40266631"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 06:32:25 -0700
Date: Thu, 13 Jun 2024 15:32:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Coelho, Luciano" <luciano.coelho@intel.com>
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/i915_pm_rpm: check
 drmModeGetConnector() before use
Message-ID: <20240613133205.ikd3kvkd7xepbufx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Coelho, Luciano" <luciano.coelho@intel.com>
References: <20240530085908.564733-1-luciano.coelho@intel.com>
 <20240530085908.564733-3-luciano.coelho@intel.com>
 <20240607151123.4o66krb6y4kwyg5u@kamilkon-DESK.igk.intel.com>
 <64137841cd6f4d3f0c8b994664a46798effefa8a.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <64137841cd6f4d3f0c8b994664a46798effefa8a.camel@intel.com>
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

Hi Coelho,,
On 2024-06-12 at 14:10:56 +0000, Coelho, Luciano wrote:
> On Fri, 2024-06-07 at 17:11 +0200, Kamil Konieczny wrote:
> > Hi Luca,
> > On 2024-05-30 at 11:59:08 +0300, Luca Coelho wrote:
> > > The drmModeGetConnector() function can return NULL in some cases, so
> > > we need to check the return value before accessing it.  This is not
> > > being checked in init_mode_set_data(), so fix that.
> > > 
> > > From the bug report:
> > > 
> > > Starting subtest: module-reload
> > > Received signal SIGSEGV.
> > > Stack trace:
> > 
> > Now I think that line 'Stack trace' is not needed, only those
> > two with subtest name and signal are enough.
> 
> Okay... it's mostly noise IMHO, anyway.
> 
> 
> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > > Cc: Jani Saarinen <jani.saarinen@intel.com>
> > > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > > ---
> > >  tests/intel/i915_pm_rpm.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> > > index 0ea5fbd8afd9..e0f395fa8a84 100644
> > > --- a/tests/intel/i915_pm_rpm.c
> > > +++ b/tests/intel/i915_pm_rpm.c
> > > @@ -515,6 +515,12 @@ static void init_mode_set_data(struct mode_set_data *data)
> > >  			data->connectors[i] =
> > >  				drmModeGetConnector(drm_fd,
> > >  						    data->res->connectors[i]);
> > > +			if (!data->connectors[i]) {
> > > +				igt_warn("Could not read connector %u\n",
> > ----------------^^^^^^^^
> > igt_debug
> > 
> > > +					 data->res->connectors[i]);
> > > +				continue;
> > > +			}
> > > +
> > 
> > We generally do not warn and fail a test in case some prerequistics
> > are not present, that is why it is better to igt_debug here
> 
> This is not about pre-requisites.  This is about a race condition where
> we get a larger number of connectors than what is actually available
> later.

You didn't write that in a comment in code nor in commit message,
looks like it could help later on when this happen.

> 
> I think the test should fail in this case, because then we will look at
> what is going on and try to figure out what's causing it.
> 
> I had igt_warn(), then you told me to change to igt_debug(), then you
> told me to change it back to igt_warn() and now you're asking me to
> change it to igt_debug, *again*?!
> 

Nevermind, let it be warn.

> 
> > and make checks in few other places, like:
> > 			if (data->connectors[i]) {
> >                     // here we can safely use/free connector or edid
> >             }
> > or
> > 			if (!data->connectors[i])
> >                 continue;
> 
> I don't get it.  Can you explain in more details?
>

I did a check locally and it seems NULLs there are not a problem,
so your change seems ok,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> > grep -n connectors tests/intel/i915_pm_rpm.c
> > 139:    drmModeConnectorPtr connectors[MAX_CONNECTORS];
> > 151:    drmModeConnectorPtr connectors[MAX_CONNECTORS];
> > 319:    for (int i = 0; i < data->res->count_connectors; i++) {
> > 320:            drmModeConnectorPtr c = data->connectors[i];
> > 513:            igt_assert(data->res->count_connectors <= MAX_CONNECTORS);
> > 514:            for (int i = 0; i < data->res->count_connectors; i++) {
> > 515:                    data->connectors[i] =
> > 517:                                                data->res->connectors[i]);
> > 518:                    data->edids[i] = get_connector_edid(data->connectors[i], i);
> > 531:            for (int i = 0; i < data->res->count_connectors; i++) {
> > 532:                    drmModeFreeConnector(data->connectors[i]);
> > 
> > so all you need is add checks in lines after 320 and 531.
> 
> I don't think it's needed in 320, because with my change we're already
> checking if the pointer was NULL when we _assigned_
> data->connectors[i].  We should never get here with a NULL in the
> table.
> 
> My change is about checking the return value of drmModeGetConnector(),
> which can return NULL, so I checked all the callers and made sure they
> check the return value.
> 
> 
> > Btw test is missing final fixture with i915 module load but that
> > should be fixed in separate patch.
> 
> Okay.
> 
> --
> Cheers,
> Luca.
