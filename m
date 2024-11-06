Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F024DD29FA8
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 07:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993AB10E63B;
	Wed,  6 Nov 2024 07:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="niKzfgyX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B504310E63B
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 07:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730877781; x=1762413781;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GJDFmmKRr8EpVbA//80RVWs7a2V7bIc0hWMzYmgflrI=;
 b=niKzfgyXp4GJJkFAZCwhynO5rq0hy20axXHFZac9Xozcq56kSNm5YMxy
 Oqgmi3nthI5lvFS2NL72IofjzO+s/rpmjVy5AmHJap5Dgek9e5N0F4d85
 afwCluKzFSbucsR6RaY8A976QjuXPKdqaWbta9+aQ/WMnCOGItKC3SzIp
 mkF0uqzLej0HnErSGpHE88YTi9/j+xSXF+xrQ8nSv3dO7UR5VxhP2rdcF
 cnlA7qEDOpkdelIe4Fd6mz03P/3PMSOgpy3Das2SOAAVcF/MpNWqGaDZb
 p0ua4NGKKosF423jBetbrd0iwzbyclcZZdHBvQ+PrPRo2o+xqA4kqPOEc g==;
X-CSE-ConnectionGUID: 5crRXB2pQWGCZ53UokK+QQ==
X-CSE-MsgGUID: WTaHk7GSRjmh1nbdP6Jr7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30881920"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="30881920"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 23:23:01 -0800
X-CSE-ConnectionGUID: 6AvMGz6xT/CPz2qghBnYjA==
X-CSE-MsgGUID: BpyEFLVYSS64WJW7n2ZLBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="85200696"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 23:22:59 -0800
Date: Wed, 6 Nov 2024 09:22:55 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, John.C.Harrison@intel.com,
 sujaritha.sundaresan@intel.com, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH i-g-t v1] tests/intel/xe_gt_freq: Change basic throttle
 API test criteria
Message-ID: <ZysZT-30AHDDjI_p@black.fi.intel.com>
References: <20241105063228.452559-1-raag.jadav@intel.com>
 <ZypDRUBurYJBd9eo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZypDRUBurYJBd9eo@intel.com>
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

On Tue, Nov 05, 2024 at 11:09:41AM -0500, Rodrigo Vivi wrote:
> On Tue, Nov 05, 2024 at 12:02:28PM +0530, Raag Jadav wrote:
> > Basic throttle API test is implemented in a way that expects multiple
> > sysfs reads to provide atomic results. Since atomicity is never guaranteed
> > between multiple sysfs reads, this is an incorrect expection from the test.
> > Change the test criteria to check for boolean value from throttle status
> > and throttle reasons sysfs entries.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3254
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3147
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810
> 
> There's clear something wrong with the 'status'....
> 
> look at this tool: https://github.com/ulissesf/qmassa
> look at the recorded example in the readme... status is poping up so much.
> that is not normal. I noticed this here as well. status is flipping to 1
> so many times while we have absolutely no one of the real reasons flipping
> to 1 as well. This is the problem that needs to be solved.

There's nothing "suspicious" that I was able to find in the driver or
the documentation. Open to suggestions.

> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  tests/intel/xe_gt_freq.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> > index de4d111ea..632415d33 100644
> > --- a/tests/intel/xe_gt_freq.c
> > +++ b/tests/intel/xe_gt_freq.c
> > @@ -121,10 +121,8 @@ static void test_throttle_basic_api(int fd, int gt_id)
> >  	reasons |= get_throttle(fd, gt_id, "reason_vr_tdc");
> >  	reasons |= get_throttle(fd, gt_id, "reason_vr_thermalert");
> >  
> > -	if (status)
> > -		igt_assert(reasons);
> > -	else
> > -		igt_assert(!reasons);
> > +	igt_assert(status == true || status == false);
> > +	igt_assert(reasons == true || reasons == false);
> 
> This would be the same as deleting the test case...

Well, given the current scenario there's nothing much we can test anyway,
other than maybe the file exists and we're reading something from it.

Raag
