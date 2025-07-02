Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348A3C8303F
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 11:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F4F10E6F4;
	Wed,  2 Jul 2025 11:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFYUMDMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E0910E6F4
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 11:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751457072; x=1782993072;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QPmwmB+MhxaScgsMOp+aHhj75VBklgg6/ZudyMIxdjg=;
 b=aFYUMDMGLjskX+sKeh//IQKjq4JQsa5KkuiGmTmVDhmjXzyBmEVue0kh
 V+5rymPxm6/PXzDxuSAsTsrK2QtODeWoV00Er4ZBc41hUJRi9/Ksa+m1Q
 n0PX5h2pSZBXka4M8CA5oUlYJ8GhpGa/DUTjVgyhMq1l7uBd43IpjJ9dh
 8y92s8IKzIVmIjl1JsxIo7PluJcffXsdVPu9jD1agh3VF4FcoUfPSTOwE
 S+GwT9czO9d74Aq0Mk4/Ld0E8eOH5a3xcaalV5IDdt06ZZt9D43UKIPa5
 5GJopd7buMtNSCknweEhozeErX4Qt9MJKb2NkA50gbvuMTTxq9YxP+5am Q==;
X-CSE-ConnectionGUID: Sx6/T8thQCuyG01xSjjQSA==
X-CSE-MsgGUID: FvIRaX3ETcuzW6hF7TQLHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64345514"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64345514"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:51:12 -0700
X-CSE-ConnectionGUID: d02H3hpcRfaF07ZJ3l6i+Q==
X-CSE-MsgGUID: GWrIvrylRaeq4YqcNH9OPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158434171"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:51:10 -0700
Date: Wed, 2 Jul 2025 13:51:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Nguyen, Brian3" <brian3.nguyen@intel.com>
Subject: Re: [i-g-t] tests/intel/xe_dma_buf_sync.c: Ensure spinner completion
Message-ID: <20250702115107.6hi7ubhy5ikipwvb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Nguyen, Brian3" <brian3.nguyen@intel.com>
References: <a2c1172f61589220cb2ee5a5ece02bb3f9f722d3.1750963929.git.jagmeet.randhawa@intel.com>
 <aF7JHvwjfOvPHjLV@kamilkon-DESK1>
 <CH0PR11MB5444338DD0527BA09D873062E541A@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444338DD0527BA09D873062E541A@CH0PR11MB5444.namprd11.prod.outlook.com>
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

Hi Cavitt,,
On 2025-07-01 at 16:59:57 +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil Konieczny
> Sent: Friday, June 27, 2025 9:39 AM
> To: Randhawa, Jagmeet <jagmeet.randhawa@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com>; Nguyen, Brian3 <brian3.nguyen@intel.com>
> Subject: Re: [i-g-t] tests/intel/xe_dma_buf_sync.c: Ensure spinner completion
> > 
> > On 2025-06-27 at 03:00:02 +0800, Jagmeet Randhawa wrote:
> > 
> > One small nit, please remove ".c" from subject, so it will
> > read:
> > 
> > [i-g-t] tests/intel/xe_dma_buf_sync: Ensure spinner completion
> 
> Agreed.  With the above change, this is
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 

Thank you, I merged it.

Regards,
Kamil

> > 
> > This could be done at merge time, no need for resend.
> > 
> > Regards,
> > Kamil
> > 
> > > Add syncobj_wait() to verify that the spinner operation on fd[0]
> > > has completely finished before proceeding to clean up.
> > > 
> > > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> > > Cc: Brian Nguyen <brian3.nguyen@intel.com>
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  tests/intel/xe_dma_buf_sync.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
> > > index 3e8d89e95..1c0e7c670 100644
> > > --- a/tests/intel/xe_dma_buf_sync.c
> > > +++ b/tests/intel/xe_dma_buf_sync.c
> > > @@ -203,6 +203,8 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
> > >  		xe_spin_end(&data[i]->spin);
> > >  		igt_assert(syncobj_wait(fd[1], &sync[1].handle, 1, INT64_MAX,
> > >  					0, NULL));
> > > +		igt_assert(syncobj_wait(fd[0], &syncobj_signal, 1, INT64_MAX,
> > > +					0, NULL));
> > >  		igt_assert_eq(data[i]->data, 0xc0ffee);
> > >  
> > >  		/* Clean up */
> > 
