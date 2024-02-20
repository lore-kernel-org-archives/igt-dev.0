Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBA8C48BC3
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 18:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553ED10E2EE;
	Tue, 20 Feb 2024 18:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxaP1T0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C693310E2EE
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 18:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708453669; x=1739989669;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=76nlIOFa4FSNOrJnlyxVm2OHbDpRJzClouuzcsHYJDs=;
 b=GxaP1T0WU9NGgVTffaBI/6XSL/JVm+RVSDsrcILWeDXVrB9UCgIJ3ilj
 RY/MijeTCTuvF7AE4fOymCbegSs1vbbCFn/FvV9QOHz8UA25paCmM8pSQ
 y+pdGO03KvnS+60IZQ8rwtIYL7gwDlSc1Y1CoQmW2jGiUMEJfAlvKKwlz
 GNqcPBr+9PKXZ34GRHT0aER/QH4wni+LoLwYkmOUVjz2CqypOQF7Vufcv
 qgTdvzlfqS9UMxkf6h5usab/Gz2lMukb4m/aCFGKVuu0lgkeLOBV4h0bK
 ycb3QbgeVYSbWZlYpgwfNjw9A6eAnV+ToWfGNQWoHkzUp6GAOEOJr7lwX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2717730"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2717730"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 10:27:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5213890"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 10:27:46 -0800
Date: Tue, 20 Feb 2024 19:27:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Helen Koike <helen.koike@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH i-g-t v1 0/3] print info in core_getversion
Message-ID: <20240220182725.utbife7rydr2twd7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Helen Koike <helen.koike@collabora.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240220101953.64371-1-kamil.konieczny@linux.intel.com>
 <4a1eb21a-c3bd-486c-b0ba-a65ab490ed0d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a1eb21a-c3bd-486c-b0ba-a65ab490ed0d@collabora.com>
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

Hi Helen,
On 2024-02-20 at 11:30:16 -0300, Helen Koike wrote:
> 
> 
> On 20/02/2024 07:19, Kamil Konieczny wrote:
> > Reorganize core_getversion test, make it a basic subtest which
> > prints info from ioctl. Add also multigpu subtest for all drm
> > cards.
> > 
> > Cc: Helen Koike <helen.koike@collabora.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > Cc: Rob Clark <robdclark@chromium.org>
> > 
> > Kamil Konieczny (3):
> >    tests/core_getversion: convert to subtest
> >    tests/core_getversion: print version info
> >    tests/core_getversion: test all drm devices
> > 
> >   tests/core_getversion.c | 50 ++++++++++++++++++++++++++++++++++++-----
> >   1 file changed, 44 insertions(+), 6 deletions(-)
> > 
> 
> Hello,
> 
> For some reason I didn't receive the patches in my email box, so let me
> write here:

I only added your address in cover letter, not knowing if anyone
would like to look into it. I will add it in v2.

> 
> On patch 3/3:
> 
> +	igt_describe("Check GET_VERSION ioctl for all drm devices.");
> +	igt_subtest("multigpu") {
> +		int fd2;
> +
> +		for (int i = 0; i < 16; ++i) {
> 
> it would be great to replace this 16 by a defined macro.
> 

Right, good point, will do.

> +			fd2 = __drm_open_driver_another(i, DRIVER_ANY);
> +			if (fd2 == -1)
> +				break;
> 
> shouldn't it be a "continue" instead of break ?
> 

Due to current implementation of __drm_open_driver_another,
tring opening here index + 2, if there is no opened index + 1,
will result in assert. This open function searches for new card
based on all previously opened so tring to skip +2 is now
not possible (by design, see comment in lib/drmtest.c).

I was thinking about solving this here (patch 3/8):

https://patchwork.freedesktop.org/series/129101/#rev8
[i-g-t,v8] lib/drmtest: allow opening cards out of order

Regards,
Kamil

> +
> +			check(fd2, info, sizeof(info));
> +			igt_info("%d: %s\n", i, info);
> +			drm_close_driver(fd2);
> +		}
> +	}
> 
> Regards,
> Helen
