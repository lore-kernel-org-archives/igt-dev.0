Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E23FC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 16:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22CF10E1AA;
	Wed, 24 Apr 2024 16:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBbfTZeZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634F910E1AA
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 16:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713976418; x=1745512418;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/zH89vZnF3AyQxjcnPGTj7GBh71LfbDDOLdE0P8tC1U=;
 b=KBbfTZeZsc12u/X5p4t5XUDWr5hqgtUq3bY/Y8lI1g4nGlNKGHXzOSIm
 txmXiHqUz+lote2a7etIxWzxGa3CuPhSP0kg7hQB8gD04cHt+ebDI9kEj
 e/npm1gRZQMLim4zqJPooc4l1NoNgobYXSR6zrKDD3e10EPIyKaBZKBTg
 6Su3+nNVSpdFBtYzCHCmpeijFpSd2BPo4q7SCRHMiI1IE+0dj5ipmrbG6
 EejHVt8YxYAy69dcfPqndVvfbiZkVMG5N8OG1KpN1cVDjd6D9309YyaSb
 nxRBmbNBdSJpLHSVXhp47LNP87T8+NIqYCjSt035NrESCdMFvHApMoguA w==;
X-CSE-ConnectionGUID: xOsUd9JGQP+pUFKMjELJZg==
X-CSE-MsgGUID: rfCV6l3eQU2l+pXzbgmS6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21043212"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="21043212"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 09:33:37 -0700
X-CSE-ConnectionGUID: e9SBNT/KR+2VYruuGsxEiQ==
X-CSE-MsgGUID: //HOCZiFTbuNpkhTaehR+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="29229824"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 09:33:36 -0700
Date: Wed, 24 Apr 2024 18:33:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: peter.senna@gmail.com
Subject: Re: tests/intel/gem_exec_capture: changing the test size breaks the
 run
Message-ID: <20240424163333.hcjdut2ol36ugppf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, peter.senna@gmail.com
References: <CA+MoWDqANoCnEUbZ1s+rbH=KMttjX+xobRze3EM-PLZMfSFHfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+MoWDqANoCnEUbZ1s+rbH=KMttjX+xobRze3EM-PLZMfSFHfg@mail.gmail.com>
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

Hi Peter,

On 2024-04-11 at 21:41:11 +0200, Peter Senna Tschudin wrote:
> Dear list,
> 
> After my change*, most of the subtests from gem_exec_capture work, but
> only if called one by one using --run-subtest. Here is an example:
> 
> $ sudo ./builddir/tests/gem_exec_capture --run-subtest many-4k-incremental
> IGT-Version: 1.28-gd54e42369 (x86_64) (Linux: 6.8.4-200.fc39.x86_64 x86_64)
> Using IGT_SRANDOM=1712863518 for randomisation
> Opened device: /dev/dri/card1
> Starting subtest: many-4K-incremental
> Target died after 20.010192s
> Captured 0 1-blobs out of a total of 131072
> Subtest many-4K-incremental: SUCCESS (22.813s)
> 
> $ sudo ./builddir/tests/gem_exec_capture --run-subtest many-2M-incremental
> IGT-Version: 1.28-gd54e42369 (x86_64) (Linux: 6.8.4-200.fc39.x86_64 x86_64)
> Using IGT_SRANDOM=1712863571 for randomisation
> Opened device: /dev/dri/card1
> Starting subtest: many-2M-incremental
> Target died after 20.059585s
> Captured 0 512-blobs out of a total of 256
> Subtest many-2M-incremental: SUCCESS (20.443s)
> 
> When not specifying the sub-test the same tests will fail. Here is the
> code that calls the tests when no sub-test is set:
> 
>     igt_subtest_f("many-4K-incremental") {
>         igt_require(gem_can_store_dword(fd, 0));
>         many(fd, dir, 1<<12, INCREMENTAL);
>     }
> 
>     igt_subtest_f("many-2M-incremental") {
>         igt_require(gem_can_store_dword(fd, 0));
>         many(fd, dir, 2<<20, INCREMENTAL);
>     }
> 
> The test many-4K-incremental will succeed and the test
> many-2M-incremental will fail. I noticed that changing the parameter
> size of the function many() is what causes the test to fail. This
> means you can successfully call many() as many times as you want,
> given all calls use the same value for size. Now see the following
> code:
> 
>     // This will succeed but "Captured 0 1-blobs out of a total of 131072"
>     igt_subtest_f("many-4K-incremental") {
>         igt_require(gem_can_store_dword(fd, 0));
>         many(fd, dir, 1<<12, INCREMENTAL);
>     }
> 
>     // This will fail
>     igt_subtest_f("many-2M-incremental") {
>         igt_require(gem_can_store_dword(fd, 0));
>         many(fd, dir, 2<<20, INCREMENTAL);
>     }
> 
>     // Captured 256 512-blobs out of a total of 256
>     igt_subtest_f("many-2M-incremental") {
>         igt_require(gem_can_store_dword(fd, 0));
>         many(fd, dir, 2<<20, INCREMENTAL);
>     }
> 
> There are two oddities:
>  - First: simply running the same test again makes it succeed.
>  - Second: Running the same test a second time changes the value of
> Captured from 0 to max.
> 
> Besides calling the test twice, closing and reopening the fd will also
> make the calls  succeed.
> 
> My first idea was that there was some memory content that was causing
> the issue, but I found no evidence of that.
> 
> Do you have ideas I can explore to try to find out what is going on here?
> 
> Thank you,
> 
> Peter
> 

These looks like a candidate to GitLab issue, where you can add
a story and descriptions. Did any of your other patches helped?

Btw that 0 captured seems a bit odd, also tests times 20s is much
too long.

Regard,
Kamil

> 
> * - https://patchwork.freedesktop.org/series/132291/
