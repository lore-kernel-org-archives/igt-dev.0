Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61853C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 16:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E661C10E1E5;
	Fri, 12 Apr 2024 16:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFoPGqAU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A0D10E3D9
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712938863; x=1744474863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dlBUQSarqoUSBvdzEsHy4ZxzBtJoO08QcX8Jj12OZPw=;
 b=mFoPGqAUePH58jIcMEgK4ArfeVH+WlYQUfL6MQ9Lelrl38ogeOB3sCTu
 m+/Mcliv6mrRQdquO5BzRfAspz6J5zyIXtpBjkz/xyjz6T3Ba2bpxE9Aa
 CwT+tCDFoEizCe1lt5j81QkGrrD6+kpqwo7mGJMiSNjugowX8yGry58lA
 rx8eGpkPK3bI0wPdRhY6mI7YmmkeIzA3SoIFe9br7pMl1pqwC3P6B4kjg
 Pi/D+XY9P9ALQ5nPe67xfsnIam5+c56zY0gpSsxXeUCRCwvYpQzCvA0QL
 Zm1vrqP2sfVzyt5oapnUL4oaQPnFxdssf4o8DeRT5rRMXHtzwVat8cos4 w==;
X-CSE-ConnectionGUID: nPCRLEetTdeA/ZRU3/INYQ==
X-CSE-MsgGUID: JOFHwZxvQ2uW8dnhEUT/Wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19795510"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="19795510"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 09:21:03 -0700
X-CSE-ConnectionGUID: kDwzB11qRYepmbw/PdHCWA==
X-CSE-MsgGUID: 9RvsNEY+RXqHm9Bz5gcmhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="26076654"
Received: from unknown (HELO localhost) ([10.245.246.170])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 09:21:01 -0700
Date: Fri, 12 Apr 2024 18:20:57 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Fix sigaction write to uninitialized
 memory
Message-ID: <20240412162057.7k2uoxh2tfabp7ll@zkempczy-mobl2>
References: <20240412122014.341267-1-zbigniew.kempczynski@intel.com>
 <54ecjzie3maj7lzz5mnqomcadfqd7o5io3yae6occ57oivl6ae@wj5reqylw2p5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54ecjzie3maj7lzz5mnqomcadfqd7o5io3yae6occ57oivl6ae@wj5reqylw2p5>
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

On Fri, Apr 12, 2024 at 09:15:43AM -0500, Lucas De Marchi wrote:
> On Fri, Apr 12, 2024 at 02:20:14PM +0200, Zbigniew Kempczyński wrote:
> > I've noticed on running kunit subtest:
> > 
> > ./xe_live_ktest --r xe_bo
> > 
> > IGT-Version: 1.28-NO-GIT (x86_64) (Linux: 6.8.0-xeint+ x86_64)
> > Using IGT_SRANDOM=1712922311 for randomisation
> > Starting subtest: xe_bo
> > Received signal SIGSEGV.
> > Stack trace:
> > #0 [fatal_sig_handler+0xda]
> > #1 [__sigaction+0x50]
> > #2 [__libc_sigaction+0x10f]
> > #3 [kunit_get_tests+0x417]
> > #4 [igt_kunit+0x35f]
> > #5 [__igt_unique____real_main41+0x44]
> > #6 [main+0x48]
> > #7 [__libc_init_first+0x90]
> > #8 [__libc_start_main+0x80]
> > #9 [_start+0x25]
> > Subtest xe_bo: CRASH (0.005s)
> > 
> > Looks this is related to sigaction() write to memory referenced
> > by uninitialized pointer located on the stack. Lets fix it.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> not idea why we are using a child process here. It seems more
> complicated than it should. But given this is indeed needed, the fix
> seems correct.

What do you mean child process here? I haven't found spawning in
the code.

--
Zbigniew

> 
> 
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Lucas De Marchi
