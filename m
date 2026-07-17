Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588AEC4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 12:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E7C10E43D;
	Fri, 17 Jul 2026 12:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="alRV/fgd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D36D10E43D
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 12:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784289847; x=1815825847;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eRUgkMV7cjqDxib0YJglzfZCL97Lv0gjdI5ZOAjeheU=;
 b=alRV/fgdiiEnxpHBq/87UcZGiWya7OUaBqUEay1OG52n1+peXLEuatGn
 24tXcqJtwY5RUwx4f213EM3bOqpwK5Aq2fkihWyDV52IHHGg18iZpHwHS
 cCaA1spEEcntEG4xsYU3rxO7jfyV4YO36LPfRVQvb+J8R2eEi2V1+vHDL
 b6iKn7msCYoDjDXyN8glcmA3YMcn7LR9KNnpykgJUA61P/xbiNViBJQid
 zPK5ZL5+EXkeG/LYfHaqoH7H8XVwQBOj4o6aA/72L4U7KVQJ/zcv8Cplr
 b1ENDS/K2hZMeZjFz1EV6usUAbaMkFMaxL09CrQKq617Eisi3GmSsoosH A==;
X-CSE-ConnectionGUID: Apt/OlWsQGq4Ei/sen9Qlg==
X-CSE-MsgGUID: ggyGv/RWT2+1tcMN3dsnAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84082643"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="84082643"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 05:04:07 -0700
X-CSE-ConnectionGUID: OMD7xgobTTSgeQ6Ano9kAg==
X-CSE-MsgGUID: CnZyMtwXT9eL3/KtXyGvFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="280059776"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 05:04:06 -0700
Date: Fri, 17 Jul 2026 14:04:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: "B, Jeevan" <jeevan.b@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] intel-ci: remove dc3co-vpb-simulation from NVL
 blocklist
Message-ID: <20260717120403.p7njyt743hvwu3uo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 "B, Jeevan" <jeevan.b@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260716184422.3255515-1-swati2.sharma@intel.com>
 <DM4PR11MB63127885A672C8E14ED6B5C290C62@DM4PR11MB6312.namprd11.prod.outlook.com>
 <4efbc1ba-f37c-4410-9423-7280e2347416@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4efbc1ba-f37c-4410-9423-7280e2347416@intel.com>
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

Hi Sharma,
On 2026-07-17 at 11:15:14 +0530, Sharma, Swati2 wrote:
> Hi Jeevan
> 
> On 17-07-2026 08:58 am, B, Jeevan wrote:
> > > -----Original Message-----
> > > From: igt-dev<igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> > > Sharma
> > > Sent: Friday, July 17, 2026 12:14 AM
> > > To:igt-dev@lists.freedesktop.org
> > > Cc: Sharma, Swati2<swati2.sharma@intel.com>
> > > Subject: [PATCH i-g-t] intel-ci: remove dc3co-vpb-simulation from NVL blocklist
> > Update intel-ci to tests/intel-ci:
> We typically commit using |intel-ci| only. Please check the git log for
> confirmation.
> Also, will check with Kamil if this info can be made as part of README.
> 
> ++Kamil

Yes, it was shortened a while ago to just "intel-ci:",
as this is a uniqe vendor named CI folder so no need
for "tests/intel-ci:" prefix.

Both are correct but shorter one is preferred.

Regards,
Kamil

> > 
> > With this PLTM.
> > 
> >   Reviewed-by: Jeevan B<jeevan.b@intel.com>
> > > Remove simulation-only kms_pm_dc subtest from the NVL display blocklist.
> > > 
> > > Signed-off-by: Swati Sharma<swati2.sharma@intel.com>
> > > ---
> > >   tests/intel-ci/xe.nvl.display.blocklist.txt | 1 -
> > >   1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-
> > > ci/xe.nvl.display.blocklist.txt
> > > index e6390d16b..d44c4030f 100644
> > > --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
> > > +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> > > @@ -81,7 +81,6 @@igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
> > > 
> > > #################################################################
> > > #############
> > >   # Valid skip: Simulation specific
> > > 
> > > #################################################################
> > > #############
> > > -igt@kms_pm_dc@dc3co-vpb-simulation
> > >   igt@kms_simulation_hpd@sim-hpd
> > > 
> > > #################################################################
> > > #############
> > >   # Valid skip: Mei interface not supported MTL+
> > > --
> > > 2.25.1
