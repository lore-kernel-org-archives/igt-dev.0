Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525B0C0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 04:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56C310E194;
	Mon, 27 Jan 2025 04:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etuMkC9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB04B10E194
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 04:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737953360; x=1769489360;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=0TJlXNzD+AF36sfhQjHagjEdy0duxWZ3gCOfbiOKA0o=;
 b=etuMkC9rYPSUbfm7sxhb5x/tovJ3Aw988+TiTJrxeJ/5PiUXy0FdVihu
 w+5PUl+f14bAIXTG7CdvCgJS+oE5+nyaiuNSCT4mmh5eZYr19KuL5Kk2j
 tcekWwXwOKP1P50VV/JWcB+R+YL4/u2b+tO+cJGIu06y0EvHNELIlmJE7
 JTgL3g3nkGB4jEiCuTq7EWIDwkrNeFBk+WwAbCR49pTPRwo46l5u9hdNq
 xhTrH9gSbsI2Zwq16Rdbp63OwZg+/jk460HruKd1TFX44aaEuoGfC3CtR
 J/t0XlTGATLX4uOSr6LbO2J1HMAZc9x801rxfaSYcqngeUam9hzM8Xtkf A==;
X-CSE-ConnectionGUID: twsdoP8BQD2NGj2eXhfQWg==
X-CSE-MsgGUID: RYboyKpARv2V5cSkO0kgCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38543603"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="38543603"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 20:49:20 -0800
X-CSE-ConnectionGUID: cfBEnnayQLayvuvcshATEA==
X-CSE-MsgGUID: HStDozRnRxS417J8yXlLNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="113312830"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.231])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 20:49:18 -0800
Date: Mon, 27 Jan 2025 05:49:15 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] lib/igt_device_scan: change device list
 variable visibility
Message-ID: <20250127044915.izkpkskylqw4gdyn@zkempczy-mobl2>
References: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
 <20250123095208.72984-3-zbigniew.kempczynski@intel.com>
 <20250124162625.2lz3spps6vgfmie6@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124162625.2lz3spps6vgfmie6@kamilkon-desk.igk.intel.com>
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

On Fri, Jan 24, 2025 at 05:26:25PM +0100, Kamil Konieczny wrote:
> Hi Zbigniew,
> On 2025-01-23 at 10:52:07 +0100, Zbigniew Kempczyński wrote:
> 
> could you improve subject? something like:
> 
> lib/igt_device_scan: Fix multithreading for Xe

Yes, I can change it to sth like 

'lib/igt_device_scan: fix multithreading support in device scanning'

because it also affects i915 even if there's not used there.

> 
> > In commit: 2e8f3e06fb (tests/xe_evict|exec_threads: Use fd reopen
> > to avoid corrupting global data) I simply changed tests which
> > corrupted device list global variable. i915 didn't use opening
> > devices in multithreaded tests but this changed with xe.
> > 
> > Device scan is now unconditional so we may change device list
> > variable visibility to TLS. With this reverting of above commit
> > should be safe (but I'm not sure is it worth to do this).
> > 
> 
> What about adding Fixes: tag? It is not a kernel so no strict
> rules here, up to you.

I don't if any freedesktop issue was created for this, maybe Lucas
knows about it.

--
Zbigniew

> 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> You forgot about:
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> LGTM so also:
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> > ---
> >  lib/igt_device_scan.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index 44b632008b..c36b0efa90 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -247,7 +247,7 @@ struct igt_device {
> >  };
> >  
> >  /* Scanned devices */
> > -static struct {
> > +static __thread struct {
> >  	struct igt_list_head all;
> >  	struct igt_list_head filtered;
> >  	bool devs_scanned;
> > -- 
> > 2.34.1
> > 
