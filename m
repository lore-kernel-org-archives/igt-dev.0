Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DC4CA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 08:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD4E10E31D;
	Thu, 28 Aug 2025 08:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KNG8TM2T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE0F10E31D
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 08:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756369301; x=1787905301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aV8NcXtwl9j4R3x7a4uBUrl7in+hfoypYgQRm/0Xxe0=;
 b=KNG8TM2Tg2oQrledCKie3khy71QunnEFTl2bfyUmqOgtFPP3y9gXachr
 +jYZ2jj1OAGJJL3yPHm1CVFw3vrCwV7GMHF937C+qHp+0n4jHC9GjIZvC
 obFqj7KaLV21r+/Yh1H08O+DEtdNYgxsbX/b9ZNSerAww0NdRe3LvWTp3
 M2l85OPow1dlZyelvL305QEZrTR3oFnhuKPjjrqQym422dF15r0A84LqV
 kswrU8xMxqJxO/zbSYZE5A+dMR0dm6ZQTfOpVTl3z/tZ537KHCXNINL4W
 gI9lc/a7ODH5vBtmUXAxJkNj566SjXGqtTtsguHhr0k8Ol/0C9b+GuBAL g==;
X-CSE-ConnectionGUID: y7tZz9bmQIu2S/MT8Bmk4g==
X-CSE-MsgGUID: 6/l+jz2aQa2SVWHF1fmd3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="84032669"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="84032669"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 01:21:41 -0700
X-CSE-ConnectionGUID: jZ4NyBEJTpi6Wo/fg6d6LQ==
X-CSE-MsgGUID: Jhua//4HT52q17mzUuJFJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="193708454"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 01:21:40 -0700
Date: Thu, 28 Aug 2025 10:21:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 3/4] tests/intel/xe_oa: Add a test for tail
 address wrap
Message-ID: <20250828082125.vcyza3e6fwzyyow2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250826224256.510692-6-umesh.nerlige.ramappa@intel.com>
 <20250826224256.510692-9-umesh.nerlige.ramappa@intel.com>
 <87cy8gmwyw.wl-ashutosh.dixit@intel.com>
 <aK-XPcRQ27iGv66y@unerlige-desk.amr.corp.intel.com>
 <85frdcjhyi.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85frdcjhyi.wl-ashutosh.dixit@intel.com>
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

Hi Dixit,,
On 2025-08-27 at 19:30:45 -0700, Dixit, Ashutosh wrote:
> On Wed, 27 Aug 2025 16:39:41 -0700, Umesh Nerlige Ramappa wrote:
> >
> > Maybe we can hold off on this patch.
> >
> > It looks like when the issue occurs, we will not be able to read reports
> > greater than fit_reports because the kmd will not be able to find valid
> > reports in the OA buffer after the wrap (since the TAIL reg is out of
> > sync).
> >
> > Will think of some other way to test this.
> 
> Yikes I forgot too. Maybe we can do something like this:
> 
> - Read fit_reports and make sure they are ok
> - Now try to read extra_reports, or even a single report. Make sure we get
>   stuck (maybe using poll()?). Timeout and send an interrupt signal to the
>   blocked thread to unblock it.
> - Now also check that the end of the buffer is non-zero
> 
> So yeah, definitely more involved.

I merged two first patches as they are fixes.
If you like to rework or merge rest feel free to do it.

Regards,
Kamil

> 
> Thanks.
> --
> Ashutosh
