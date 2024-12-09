Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C59E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 17:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930D010E4E8;
	Mon,  9 Dec 2024 17:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FS6+PaI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A7A10E4E8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 17:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733766530; x=1765302530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=71OEg/ZdMdjYx1iaOPhYhq9S26Uu6+B9nXh3VIupoCY=;
 b=FS6+PaI2Ff7k8tN8LQDMox6Y4d+8W/3/fvSS/DOI4L+pXJtqu77MH+6D
 QVbydQzWmecB6UPxqS+iRe2ntJGadpHVQyFqr1KbYpSvLwXz6fKgSYq5+
 +eRxqkx8gXCR95xW6d+GuH924sdQKLAHGJtSTm/W66pgnIf9x3hbp++Q+
 NYK0H4C/gSe6KH0vxWhY9KdhgT7V6KAh08Wqo37HqV+ZbJcH19qY6SM7h
 vVWZWfr0UA6hLIHUNqlC0fTvWds4ilZGg3w6T9eb50Mt70QqH6OQh7evo
 01Ztsg7g+K9vepTcCkNXL+dBCm3+OncZ6kUFZBjiAiOAwaVgUjG0o4ACY w==;
X-CSE-ConnectionGUID: 1XHJ6Uu8SZiYzGUQYMH7nw==
X-CSE-MsgGUID: +R1t6y39S8mjL/8hlMxunw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44757986"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="44757986"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 09:48:49 -0800
X-CSE-ConnectionGUID: ipQpfJpVQ0ygUsW/x73P3Q==
X-CSE-MsgGUID: wOIBog5ITh+6pvy/8f55GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="94985616"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 09:48:48 -0800
Date: Mon, 9 Dec 2024 18:48:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH i-g-t] lib/igt_profiling: add include for PATH_MAX constant
Message-ID: <20241209174846.fhr7udtqh42jrh4k@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
References: <20241103171806.10248-1-arkamar@atlas.cz>
 <202412892440-Z1Vl2JjW1W30ZH4q-arkamar@atlas.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202412892440-Z1Vl2JjW1W30ZH4q-arkamar@atlas.cz>
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

Hi Petr,
On 2024-12-08 at 10:24:40 +0100, Petr Vaněk wrote:
> Hi igt-devs,
> 
> On Sun, Nov 03, 2024 at 06:18:06PM +0100, Petr Vaněk wrote:
> > PATH_MAX constant is defined in limits.h header file. It needs to be
> > explicitly included in musl environment as it is not transitively
> > available for any of available includes.
> 
> gentle ping. It has been a month since I sent the patch.
> 
> Cheers,
> Petr
> 

Sorry, I forgot about this, your patch merged.

Regards,
Kamil

> > Fixes: 9366bee04d16 ("lib: Add DRM driver sysfs profiling knob toggling functions")
> > Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Signed-off-by: Petr Vaněk <arkamar@atlas.cz>
> > ---
> >  lib/igt_profiling.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
> > index b61506742..e1526ad98 100644
> > --- a/lib/igt_profiling.c
> > +++ b/lib/igt_profiling.c
> > @@ -10,6 +10,7 @@
> >  #include <assert.h>
> >  #include <dirent.h>
> >  #include <fcntl.h>
> > +#include <limits.h>
> >  #include <stdbool.h>
> >  #include <stdio.h>
> >  #include <stdlib.h>
> > -- 
> > 2.45.2
> > 
