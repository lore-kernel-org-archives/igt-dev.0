Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBCAC52D7C
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 09:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD91610E077;
	Fri, 23 Aug 2024 09:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkIhM19E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E47610E077
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724406076; x=1755942076;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q2vV+T+bD7a5/NWZUvYkq9i29cz88/0zCF4xAe3PuOU=;
 b=QkIhM19E2W0falDqWLoGqwll6uRCLkZ4ZvshlB4f0DNd5p3mpTVIIAcD
 OW3fPGNSuRO3CmK0+GDdmeDN1St94wA7/A/EODteNwgOAXmp7ZRoNhxe5
 U+DsggLvBaxqW5z6X4SIlrMy4ft5Wg6j/Oz9Z+JsCszhQNBGs19UztalX
 49pCH0JfDTEMi3RgtT210pHKWtm15gUrE2ZTT93ehBHuYaSO9u6Ub1SE7
 Mruo2RFWlCj/dsSnBCeyXlzNK70Xca4EyIv3fwfINLpRlOIA5ODo7x9MT
 z4EsFiTtTlB0EadSRKO71EAEfcDMzbyLv1NJhieg/kK1PYhvUnbortwKM Q==;
X-CSE-ConnectionGUID: n5O/jaMdQheqZq9Hv9DsDw==
X-CSE-MsgGUID: ytqcKrWiTgWmXIFwYrzfvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22729146"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="22729146"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 02:41:16 -0700
X-CSE-ConnectionGUID: nvKHMWzvTiCaa55DliF5rA==
X-CSE-MsgGUID: QbLYtvmlSJ2ybiRJgE8OLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="61419897"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 02:41:14 -0700
Date: Fri, 23 Aug 2024 11:41:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Mohammed Anas <triallax@tutanota.com>,
 Stefano Ragni <st3r4g@protonmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Reagan Bohan <xbjfk.github@gmail.com>, Yureka <yuka@yuka.dev>
Subject: Re: [PATCH i-g-t v1 1/1] tests/intel/kms_pm_backlight: Fixed build
 on musl
Message-ID: <20240823094111.tik3n3wy2vhg4rib@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Mohammed Anas <triallax@tutanota.com>,
 Stefano Ragni <st3r4g@protonmail.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Reagan Bohan <xbjfk.github@gmail.com>, Yureka <yuka@yuka.dev>
References: <20240821095137.60254-1-kamil.konieczny@linux.intel.com>
 <20240821095137.60254-2-kamil.konieczny@linux.intel.com>
 <3305001.aeNJFYEL58@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3305001.aeNJFYEL58@jkrzyszt-mobl2.ger.corp.intel.com>
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

Hi Janusz,
On 2024-08-22 at 20:44:54 +0200, Janusz Krzysztofik wrote:
> Hi Kamil,
> 
> On Wednesday, 21 August 2024 11:51:37 GMT+2 Kamil Konieczny wrote:
> > Fix compilation on musl by including proper POSIX header for
> > basename. Also while at this, sort out other headers.
> > 
> > Cc: Mohammed Anas <triallax@tutanota.com>
> > Cc: Stefano Ragni <st3r4g@protonmail.com>
> > Cc: Bernd Kuhls <bernd@kuhls.net>
> > Cc: Reagan Bohan <xbjfk.github@gmail.com>
> > Reported-by: Yureka <yuka@yuka.dev>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/intel/kms_pm_backlight.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> > index 8672afa7a..c2213d3b1 100644
> > --- a/tests/intel/kms_pm_backlight.c
> > +++ b/tests/intel/kms_pm_backlight.c
> > @@ -35,15 +35,17 @@
> >   * Test category: functionality test
> >   */
> >  
> > -#include "igt.h"
> > +#include <unistd.h>
> 
> Assuming you tried to follow the linux kernel rule of sorting headers 
> alphabetically, why did you place unistd.h at the top?
> 

I remember Mauro mentioned that this is special header, maybe for
unicode and wchar types? But I agree with you, I will move it down.

> > +#include <errno.h>
> > +#include <fcntl.h>
> > +#include <libgen.h> /* for POSIX basename */
> 
> LGTM.
> 
> >  #include <limits.h>
> > +#include <stdio.h>
> >  #include <sys/types.h>
> >  #include <sys/stat.h>
> 
> With still the same assumption, did you notice the above two headers are in 
> reverse alphabetic order?

You are right, I missed that.

> 
> With either the headers in correct alphabetic order, or otherwise the existing 
> headers untouched:
> 
> Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Thank you for review,

Regards,
Kamil

> 
> Thanks,
> Janusz
> 
> > -#include <fcntl.h>
> > -#include <stdio.h>
> > -#include <errno.h>
> > -#include <unistd.h>
> >  #include <time.h>
> > +
> > +#include "igt.h"
> >  #include "igt_device.h"
> >  #include "igt_device_scan.h"
> >  
> > 
> 
> 
> 
> 
