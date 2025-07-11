Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F23CC83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 11:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3A910E9BD;
	Fri, 11 Jul 2025 11:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYpRvNg4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A3110E9BD
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752231790; x=1783767790;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oTe8slwBao8YgTXoCTlFryeHRopQbc1Ay5WB5mO4LaE=;
 b=LYpRvNg4pDNkFJk/2mFUHl7AMBc1uLuFdHzUnhIoD989UYhB/wczZpEH
 l9h8FguhOpINNjcTFLeNqkCwkA7dFUFf6s0yfQXu2eEfyLYfDApO0Qnqz
 Q548OhnOzVfwtmiizTBUJ/fagJaygpKJIVYkwXKgAge0AFF6J6/6VBkv8
 MEJ4BQLqcwG3NFVfXwJToD7xQfVgm3oJGPRuguwF+wml3RBoIDuiAQjbN
 nYofmE80JNvAAvHKmbgd51f2lcIwvdlAkKqazeBcmN1F9K7JamSSN6aF7
 vEI9Y7itxQX+QjtIdZlEllW7KqH9sPsqNENzp/IekNBp8qVlKxpue/A4N g==;
X-CSE-ConnectionGUID: 5cP5GxxBSzu9SaZHVLqTyw==
X-CSE-MsgGUID: v02bOyfhR+OgLThKFO9fqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54500313"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54500313"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 04:03:10 -0700
X-CSE-ConnectionGUID: fUPNHBbyRnqsup4e+Rwv5A==
X-CSE-MsgGUID: 5C1/vK0xRauKvRwogtbY+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="155759130"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 04:03:08 -0700
Date: Fri, 11 Jul 2025 13:03:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly prosyak <vprosyak@amd.com>
Cc: igt-dev@lists.freedesktop.org, Jesse Zhang <Jesse.Zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_basic: fix compilation warning
Message-ID: <20250711110305.a7prjailwtjocinu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly prosyak <vprosyak@amd.com>, igt-dev@lists.freedesktop.org,
 Jesse Zhang <Jesse.Zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250710123406.84306-1-kamil.konieczny@linux.intel.com>
 <87c40728-6032-41e3-9d6f-93b97eba45bc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87c40728-6032-41e3-9d6f-93b97eba45bc@amd.com>
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

Hi vitaly,
On 2025-07-10 at 14:05:44 -0400, vitaly prosyak wrote:
> The patch looks great to me — much appreciated for your quick response via email.
> 
> Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com
> 
> Are you planning to merge it yourself, or would you prefer that I take care of it?
> 
> Thanks!

Thank you, I merged it.

Regards,
Kamil

> 
> On 2025-07-10 08:34, Kamil Konieczny wrote:
> > Fix compilation warning:
> > [1564/2025] Compiling C object tests/amdgpu/amd_basic.p/amd_basic.c.o
> > ../tests/amdgpu/amd_basic.c:142:13: warning: 'amdgpu_test_all_queues' defined but not used [-Wunused-function]
> >   142 | static void amdgpu_test_all_queues(amdgpu_device_handle device, bool user_queue)
> >       |             ^~~~~~~~~~~~~~~~~~~~~~
> >
> > Cc: Jesse Zhang <Jesse.Zhang@amd.com>
> > Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > Fixes: b195a6c65cdd ("tests/amdgpu: Add test coverage for all user-mode queues across IP blocks")
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/amdgpu/amd_basic.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> > index 100a634ce..45cf64251 100644
> > --- a/tests/amdgpu/amd_basic.c
> > +++ b/tests/amdgpu/amd_basic.c
> > @@ -707,8 +707,8 @@ igt_main
> >  	int r;
> >  	bool arr_cap[AMD_IP_MAX] = {0};
> >  	bool userq_arr_cap[AMD_IP_MAX] = {0};
> > +	bool enable_test = false;
> >  #ifdef AMDGPU_USERQ_ENABLED
> > -	bool enable_test;
> >  	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
> >  
> >  	enable_test = env && atoi(env);
> > @@ -805,11 +805,9 @@ igt_main
> >  		}
> >  	}
> >  
> > -#ifdef AMDGPU_USERQ_ENABLED
> > -
> >  	igt_describe("Check-GFX-CS-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
> >  	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX-UMQ") {
> > -		if (userq_arr_cap[AMD_IP_GFX]) {
> > +		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
> >  			igt_dynamic_f("cs-gfx-with-umq")
> >  			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, true);
> >  		}
> > @@ -817,7 +815,7 @@ igt_main
> >  
> >  	igt_describe("Check-COMPUTE-CS-for-every-available-ring-works-for-write-const-fill-copy-and-nop-operation");
> >  	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE-UMQ") {
> > -		if (userq_arr_cap[AMD_IP_COMPUTE]) {
> > +		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
> >  			igt_dynamic_f("cs-compute-with-umq")
> >  			amdgpu_command_submission_compute(device, true);
> >  		}
> > @@ -825,7 +823,7 @@ igt_main
> >  
> >  	igt_describe("Check-sync-dependency-using-GFX-ring");
> >  	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX-UMQ") {
> > -		if (userq_arr_cap[AMD_IP_GFX]) {
> > +		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
> >  			igt_dynamic_f("sync-dependency-test-with-umq")
> >  			amdgpu_sync_dependency_test(device, true);
> >  		}
> > @@ -848,7 +846,6 @@ igt_main
> >  			amdgpu_test_all_queues(device, true);
> >  		}
> >  	}
> > -#endif
> >  
> >  	igt_fixture {
> >  		amdgpu_device_deinitialize(device);
