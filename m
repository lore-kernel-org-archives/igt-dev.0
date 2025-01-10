Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4B2E77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 14:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB19A10F0E9;
	Fri, 10 Jan 2025 14:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECca1YYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F2F10F0E9
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736519401; x=1768055401;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q+eDzAjyr/p6ZJCWYxtBDwv0+xQTeASEO7PBRJ1XbRw=;
 b=ECca1YYT3DEk/hdO63UIkixktdPJQyIte3yzhsDCoM7biIlzhG4JBTm2
 5qNB4MA2FFnUvz/WzU0shZAYAdw+yrDrag1Gahb1F1VTd0PjfpUUsUjko
 7fXL/hqt0pAzq9S9wDwdaI58jyr+BLDwiSUPouVF02MGhTE4/fXWBYW/i
 vIwnd4sztZsglp/OK2dagfGaju49s2oYymkiLQPhXEedVq5HG3fmU7Mns
 n0KnZ8UVbNsFXYWwhDuEBXFCnLqaUy+YgmNV1d7O3xncAq1jJaLqeBq9Q
 K07OOF2JjaYN8nvdiZpnH9PE6L/56vgPo+5u6NCWArMyjMrcveG5YmnCR A==;
X-CSE-ConnectionGUID: lUAWoDBNSSaMbnxszK3t4w==
X-CSE-MsgGUID: dij1zo1lTX+qGQAGPvH8DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36696327"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36696327"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 06:30:01 -0800
X-CSE-ConnectionGUID: OKQIePjUREWDzhXgYZ5Gug==
X-CSE-MsgGUID: Cc1uO9dHSZukSwWZwFhx0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107789371"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 06:29:59 -0800
Date: Fri, 10 Jan 2025 15:29:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Samala, Pranay" <pranay.samala@intel.com>,
 "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: Re: [PATCH i-g-t v3] tests/intel/kms_fbcon_fbt: Add skip condition
 for bmg platform
Message-ID: <20250110142957.4wwqkewpdctxgrhc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Samala, Pranay" <pranay.samala@intel.com>,
 "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
References: <20230328023811.46847-1-mohammed.thasleem@intel.com>
 <20250103115710.84108-1-mohammed.thasleem@intel.com>
 <PH7PR11MB6053C2A03BA98B141B4EF65EE7152@PH7PR11MB6053.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PH7PR11MB6053C2A03BA98B141B4EF65EE7152@PH7PR11MB6053.namprd11.prod.outlook.com>
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

Hi Thasleem,
On 2025-01-03 at 14:22:39 +0000, Samala, Pranay wrote:
> Hi Thasleem,
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mohammed
> > Thasleem
> > Sent: Friday, January 3, 2025 5:27 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> > Subject: [PATCH i-g-t v3] tests/intel/kms_fbcon_fbt: Add skip condition for bmg
> > platform

Please improve subject a little:
[PATCH i-g-t v3] tests/intel/kms_fbcon_fbt: Skip FBC testing on BMG platform

> > 
> > FBC test isn't supported on bmg, skip the test on this platform.
> > 
> > v2: Add workaround id: Wa_16023588340. (Pranay)
> >     Use IS_BATTLEMAGE check instead using devid.
> > v3: Add workaround id in code.
> > 
> > Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Please add Reviewed-by as RB is not reflecting.
> 
> Thanks and Regards,
> Pranay Samala

This and above could be done at merge but first please also
reply to CI failure and inform that SKIP on BMG is desired,
so our bug filing team could improve filters.

Inform them also about non-related reported failures.

Regards,
Kamil

> > ---
> >  tests/intel/kms_fbcon_fbt.c | 17 ++++++++++++++---
> >  1 file changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c index
> > ab4819d23..9c3ff7a21 100644
> > --- a/tests/intel/kms_fbcon_fbt.c
> > +++ b/tests/intel/kms_fbcon_fbt.c
> > @@ -73,7 +73,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between
> > fbcon and the frontbuffer "
> >  #define MAX_CONNECTORS 32
> > 
> >  struct drm_info {
> > -	int fd, debugfs_fd, crtc_id;
> > +	int fd, debugfs_fd, crtc_id, devid;
> >  	struct igt_fb fb;
> >  	drmModeResPtr res;
> >  	drmModeConnectorPtr connectors[MAX_CONNECTORS]; @@ -418,6
> > +418,8 @@ static void setup_environment(struct drm_info *drm)
> >  	igt_require(drm->fd >= 0);
> >  	drm->debugfs_fd = igt_debugfs_dir(drm->fd);
> >  	igt_require(drm->debugfs_fd >= 0);
> > +	drm->devid = intel_get_drm_devid(drm->fd);
> > +	igt_require(drm->devid >= 0);
> > 
> >  	drm->res = drmModeGetResources(drm->fd);
> >  	igt_require(drm->res);
> > @@ -457,16 +459,25 @@ igt_main
> > 
> >  	igt_describe("Test the relationship between fbcon and the frontbuffer "
> >  		     "tracking infrastructure with fbc enabled.");
> > -	igt_subtest("fbc")
> > +	igt_subtest("fbc") {
> > +		/* FBC disabled: Wa_16023588340 */
> > +		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported
> > on
> > +BMG\n");
> >  		subtest(&drm, &fbc, false);
> > +	}
> > +
> >  	igt_describe("Test the relationship between fbcon and the frontbuffer "
> >  		     "tracking infrastructure with psr enabled.");
> >  	igt_subtest("psr")
> >  		subtest(&drm, &psr, false);
> > +
> >  	igt_describe("Suspend test to validate  the relationship between fbcon
> > and the frontbuffer "
> >  		     "tracking infrastructure with fbc enabled.");
> > -	igt_subtest("fbc-suspend")
> > +	igt_subtest("fbc-suspend") {
> > +		/* FBC disabled: Wa_16023588340 */
> > +		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported
> > on
> > +BMG\n");
> >  		subtest(&drm, &fbc, true);
> > +	}
> > +
> >  	igt_describe("Suspend test to validate the relationship between fbcon
> > and the frontbuffer "
> >  		     "tracking infrastructure with psr enabled.");
> >  	igt_subtest("psr-suspend")
> > --
> > 2.34.1
> 
