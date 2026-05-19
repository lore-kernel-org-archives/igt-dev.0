Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB38DCD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 09:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB1B10E103;
	Tue, 19 May 2026 09:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPgPIKYn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CCE10E103
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779184355; x=1810720355;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SK8LwMVhpSWwhWsLRAUhZN7ZgwWKorkpi7fsKWqBmSA=;
 b=mPgPIKYnFxjEzq/JgXX1zvhNHiLGYlGolxIFKLDFHcqkpCj9XcmyluQZ
 F/ZnAdkq34u6UjzYyrQFyJNc2d+u/5lNlNYjBWXDf66r5u6yWSQoVOR3s
 u18UzT0KcuQmltC5SwkJ1td8dauOP6xFl2mraX+bVSJnJK/sSD4Jk+2UF
 BpIgc70+b0Y8q3uUfHqpRin4Tn3VJ6L5gL0Ng7lOadNVSPMLVVVch2CEh
 j2JI/L02c2SXs/M/vFOOjLlhV9KNmQLHxP8LowpyKIt7rkYj5xBvumHmz
 9x8cBRgykTILva4MR5/SpalMzQ77N8gWazo06aoQSP9QbgC/io+0xUJMJ w==;
X-CSE-ConnectionGUID: 7GmCKcaQRY+ZESKHfcKA5Q==
X-CSE-MsgGUID: RidkYscLSm27H8mGstx/ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79957818"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79957818"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 02:52:32 -0700
X-CSE-ConnectionGUID: 0YcfSZyZTny+O37CrpEQzg==
X-CSE-MsgGUID: giZSXnbrRceudWBwAy9yJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="244713270"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 02:52:28 -0700
Date: Tue, 19 May 2026 11:52:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2] lib/intel_wa: Assert on error instead of returning -1
Message-ID: <20260519095226.r2e7k3ntd552rqgn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260514063655.1683322-1-shekhar.chauhan@intel.com>
 <20260515122408.zd564l5tnhaprha3@kamilkon-DESK.igk.intel.com>
 <87ecjbgofi.wl-ashutosh.dixit@intel.com>
 <87cxysgtr3.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87cxysgtr3.wl-ashutosh.dixit@intel.com>
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

Hi all,
On 2026-05-18 at 16:53:04 -0700, Dixit, Ashutosh wrote:
> On Sat, 16 May 2026 12:11:13 -0700, Dixit, Ashutosh wrote:
> >
> > On Fri, 15 May 2026 05:24:08 -0700, Kamil Konieczny wrote:
> > >
> >
> > Hi Kamil,
> >
> > > Hi Shekhar,
> > > On 2026-05-14 at 12:06:55 +0530, Shekhar Chauhan wrote:
> > > > igt_has_intel_wa() returns 0, 1, or -1, but there is no point
> > > > distinguishing the error and no-workaround cases for callers. Replace
> > > > the error return with igt_assert() and simplify debugfs_file_has_wa() by
> > > > dropping the igt_debugfs_exists() check, since igt_sysfs_get() returns
> > > > NULL for missing files anyway.
> > > >
> > > > v2: Make the func as bool instead of int.
> > > >
> > > > Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> > > > ---
> > > >  lib/intel_wa.c | 19 +++++++++----------
> > > >  lib/intel_wa.h |  2 +-
> > > >  2 files changed, 10 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/lib/intel_wa.c b/lib/intel_wa.c
> > > > index 727dd6c98..e4fe7b0ee 100644
> > > > --- a/lib/intel_wa.c
> > > > +++ b/lib/intel_wa.c
> > > > @@ -7,18 +7,18 @@
> > > >  #include <stdint.h>
> > > >  #include <stdio.h>
> > > >
> > > > +#include "igt_core.h"
> > > >  #include "igt_debugfs.h"
> > > >  #include "igt_sysfs.h"
> > > >  #include "intel_wa.h"
> > > >  #include "xe/xe_query.h"
> > > >
> > > > -static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> > > > +static bool debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> > > >			       const char *debugfs_name, const char *wa)
> > > >  {
> > > >	char *debugfs_dump;
> > > >
> > > > -	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
> > > > -		return -1;
> > > > +	igt_assert(igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY));
> > > >
> > > >	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
> > > >	if (debugfs_dump) {
> > > > @@ -27,10 +27,10 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> > > >		free(debugfs_dump);
> > > >
> > > >		if (has_wa)
> > > > -			return 1;
> > > > +			return true;
> > > >	}
> > > >
> > > > -	return 0;
> > > > +	return false;
> > > >  }
> > > >
> > > >  /**
> > > > @@ -38,18 +38,17 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> > > >   * @drm_fd:	A drm file descriptor
> > > >   * @check_wa:	Workaround to be checked
> > > >   *
> > > > - * Returns:	0 if no WA, 1 if WA present, -1 on error
> > > > + * Returns:	true if WA present, false otherwise
> > > >   */
> > > > -int igt_has_intel_wa(int drm_fd, const char *check_wa)
> > > > +bool igt_has_intel_wa(int drm_fd, const char *check_wa)
> > > >  {
> > > > -	int ret = 0;
> > > > +	bool ret = 0;
> > > >	int debugfs_fd;
> > > >	unsigned int xe;
> > > >	char name[256];
> > > >
> > > >	debugfs_fd = igt_debugfs_dir(drm_fd);
> > > > -	if (debugfs_fd == -1)
> > > > -		return -1;
> > > > +	igt_assert(debugfs_fd >= 0);
> > >
> > > This will mean that all other users needs to be updated.
> >
> > To date there are no other users of this function, except one in OA.
> >
> > > The way of adding any igt_assert/igt_require into lib/
> > > make it impossible to reuse them in tools/ and require
> > > to write same functionality twice, one in lib/ and one
> > > for any tools which will want to use them. Or to write
> > > __function() without igt_assert/igt_require.
> >
> > Well it was I who suggested doing this. Can you explain your point a bit?
> > Any tools which use a lib function which uses e.g. igt_assert/igt_require
> > can also link with lib_igt (which provides igt_assert/igt_require). See
> > e.g. tools/xe-perf/meson.build. It is not unreasonable for IGT tools to
> > link with lib_igt. I thought not linking with igt_lib was an unreasonabe
> > requirement and I removed it for tools/xe-perf.

Main reason was a tools asserting in middle of operation, where
it should just report an error, lack of permission or some
other reason why it cannot proceed. Another example would be
implemetation of malloc() where lib will assert instead of
returning a NULL pointer.

> >
> > If you are saying tools should be able to run without debugfs mounted,
> > maybe you have a point. In that case we can drop this patch. But even here
> > maybe IGT tools should run only with debugfs mounted?

Definitly not, there are systems without debugfs for security
reasons, and there is sysfs so for example intel_gpu_freq should
work perfectly fine.

> 
> Also the tool should realize it is calling a function which requires
> debugfs, and separately check whether or not debugfs is mounted and skip
> calling the function if it isn't. So I am not sure why we should do
> anything different, since wa list is exposed through debugfs.
> 

Well, as it is only used in intel perf tests/tools, it is ok
so I will not block it, you can merge it.

Regards,
Kamil

> >
> >
> > > >	xe_for_each_gt(drm_fd, xe) {
> > > >		sprintf(name, "gt%d/workarounds", xe);
> > > > diff --git a/lib/intel_wa.h b/lib/intel_wa.h
> > > > index 765a5948e..34cafecc4 100644
> > > > --- a/lib/intel_wa.h
> > > > +++ b/lib/intel_wa.h
> > > > @@ -6,6 +6,6 @@
> > > >  #ifndef __INTEL_WA_H__
> > > >  #define __INTEL_WA_H__
> > > >
> > > > -int igt_has_intel_wa(int drm_fd, const char *check_wa);
> > > > +bool igt_has_intel_wa(int drm_fd, const char *check_wa);
> > > >
> > > >  #endif /* __INTEL_WA_H__ */
> > > > --
> > > > 2.53.0
> > > >
