Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8406BC4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 12:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CC910E43D;
	Fri, 17 Jul 2026 12:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5mhjahS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6F610EAB0
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 12:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784289954; x=1815825954;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0ysmm0TzWulre1aynh+3JbnbuxcWoNq8PZW6eMJQvlo=;
 b=m5mhjahSYEUipV99mVPn8JqY8A9RTWrDVb7deV/w0tptSZFbVPE6Qsav
 UESsRFCNixSuW9EyLIqQaD+uCm+RoHvI55rJudkI6mQznleYsRDGjthbi
 eZO/KIu9li13vYuVWM0SU0T8dz0IEbRUJ/imEPeaZnKoJ7QGTsZlZ2VNc
 3o253OMQKRSAcaIvtxeSAFHZN7VtRtqcmbgL8+dZ6497PrYphljAYCQ8F
 oWa8zoASxuQV+ZYKQu57g7K5/ppwGl7apf2mwQduPZpqWhsqGbVuRw216
 RB9xi64ZyoUTZtkv44nEPg2soN0CKtRDpU1C9Pv54UPjx6iWDnhQjH2q2 w==;
X-CSE-ConnectionGUID: A5Nt/JCITP+UHrAf381uRQ==
X-CSE-MsgGUID: gJHDtscLRpug/3TKnhH/AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96324245"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="96324245"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 05:05:51 -0700
X-CSE-ConnectionGUID: 8XmVVfWiQiCWhaYN51j7pg==
X-CSE-MsgGUID: ZIVvnfqEQUWYv9JuMKlolw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="250419103"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 05:05:50 -0700
Date: Fri, 17 Jul 2026 14:05:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] intel-ci: remove dc3co-vpb-simulation from NVL
 blocklist
Message-ID: <20260717120548.flfbxvygmsnslbff@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "B, Jeevan" <jeevan.b@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260716184422.3255515-1-swati2.sharma@intel.com>
 <DM4PR11MB63127885A672C8E14ED6B5C290C62@DM4PR11MB6312.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM4PR11MB63127885A672C8E14ED6B5C290C62@DM4PR11MB6312.namprd11.prod.outlook.com>
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

Hi Jeevan,
On 2026-07-17 at 03:28:47 +0000, B, Jeevan wrote:
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> > Sharma
> > Sent: Friday, July 17, 2026 12:14 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> > Subject: [PATCH i-g-t] intel-ci: remove dc3co-vpb-simulation from NVL blocklist
> Update intel-ci to tests/intel-ci: 
> 
> With this PLTM. 
> 
>  Reviewed-by: Jeevan B <jeevan.b@intel.com>

Can you start line with your r-b without a space?
Our patchwork software cannot cope with it and
do not mark a patch with r-b.

Regards,
Kamil

> > 
> > Remove simulation-only kms_pm_dc subtest from the NVL display blocklist.
> > 
> > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > ---
> >  tests/intel-ci/xe.nvl.display.blocklist.txt | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-
> > ci/xe.nvl.display.blocklist.txt
> > index e6390d16b..d44c4030f 100644
> > --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
> > +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> > @@ -81,7 +81,6 @@ igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
> > 
> > #################################################################
> > #############
> >  # Valid skip: Simulation specific
> > 
> > #################################################################
> > #############
> > -igt@kms_pm_dc@dc3co-vpb-simulation
> >  igt@kms_simulation_hpd@sim-hpd
> > 
> > #################################################################
> > #############
> >  # Valid skip: Mei interface not supported MTL+
> > --
> > 2.25.1
> 
