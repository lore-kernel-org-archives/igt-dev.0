Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE84BCFC29F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 18:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECA810E037;
	Fri, 21 Nov 2025 18:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iawt44+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065A410E037
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763751246; x=1795287246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=243W7bcnTJ+m7AXYRPTqS9OYWtvQ28bkCLzvqTBxmBI=;
 b=iawt44+Efy3Yx7kaAUgttaIHmHlxWFzWOcm2Ac5u+0TahWtgon+lsFHd
 WupZSW8akH2/beuevuNoEUs6OhlG0aWs8q2m81o6TbEMX6s8T5Dc4ZN2Z
 i7xpWJj15d/cPFSCvEeNuh2gDI9zRKQaMPpuPKPRMSt1UY5oObzshD4cW
 RZfaUN08IOCSqM9r8gr8eadYr0qKSbJhZTb8MsgfSMgWS8f/CruTpl1it
 a1GUBWwCZtPK0pbAMtd0LO8LaneiAcVYLHhifKGXTqsKwBU0LO0www1Re
 tEBWr+pi1L4icEODsrDQDkJCmuu5vWbi+1dEkKsNnAIt40xVhsX8zxonS A==;
X-CSE-ConnectionGUID: D/7u68IbQ+KUKwwSR4RReQ==
X-CSE-MsgGUID: xir2nKgjS3afN71fQlHKuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="53422433"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="53422433"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 10:54:05 -0800
X-CSE-ConnectionGUID: 0QoGqG/cS2eNiVzTvUiJrg==
X-CSE-MsgGUID: k/6/iNC2RUK4CsBzaMXfvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="196230627"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 10:54:05 -0800
Date: Fri, 21 Nov 2025 19:53:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Wang, X" <x.wang@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Sebinraj, S" <s.sebinraj@intel.com>
Subject: Re: [PATCH i-g-t v1 0/2] intel_gpu_frequency: Allow printing
 frequencies by regular user
Message-ID: <20251121185348.yfu3zulmcablotfs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Wang, X" <x.wang@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Sebinraj, S" <s.sebinraj@intel.com>
References: <20251120103139.17169-1-kamil.konieczny@linux.intel.com>
 <SA3PR11MB80463F19B48B6655D0DD0DF486D5A@SA3PR11MB8046.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SA3PR11MB80463F19B48B6655D0DD0DF486D5A@SA3PR11MB8046.namprd11.prod.outlook.com>
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

Hi Wang,,
On 2025-11-21 at 06:31:57 +0000, Wang, X wrote:
> Hi Kamil & Sebinraj
> 
> https://patchwork.freedesktop.org/patch/689709/?series=156767&rev=5
> 
> [i-g-t,v5] tools/intel_gpu_frequency: Allow regular users to use get operation
> 
> seems to address a similar goal. Do you think it makes sense to combine these two series into one?
> 
> Thanks
> Xin
> 

I do not know, I do like this output:

card/tile/GT    BDF                min   curr    RP1    max    RP0    RPn (MHz)
------------    ------------      ----   ----   ----   ----   ----   ----
1/t0/GT0        0000:00:02.0       100    350    350   1300   1300    100

Imho my series is feature cleanup, that one is adding new
functionality. Let me send my new improved version, I did miss
few corner cases in v1. Btw I plan on removing drmtest
dependancy, so no __drm_open_driver() and similar calls.

Regards,
Kamil

> > -----Original Message-----
> > From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Sent: Thursday, November 20, 2025 02:32
> > To: igt-dev@lists.freedesktop.org
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Sebinraj, S
> > <s.sebinraj@intel.com>; Wang, X <x.wang@intel.com>
> > Subject: [PATCH i-g-t v1 0/2] intel_gpu_frequency: Allow printing frequencies
> > by regular user
> > 
> > Currently printing current frequencies with this tool without sudo nor root
> > rights ends with an assert and a FAIL, like in any igt test:
> > 
> > $ build/tools/intel_gpu_frequency
> > (intel_gpu_frequency:3142) intel_chipset-CRITICAL: Test assertion failure
> > function intel_get_drm_devid, file ../lib/intel_chipset.c:145:
> > (intel_gpu_frequency:3142) intel_chipset-CRITICAL: Failed assertion:
> > is_intel_device(fd)
> > (intel_gpu_frequency:3142) intel_chipset-CRITICAL: Last errno: 9, Bad file
> > descriptor Stack trace:
> >   #0 ../lib/igt_core.c:2075 __igt_fail_assert()
> >   #1 ../lib/intel_chipset.c:155 intel_get_drm_devid()
> >   #2 ../tools/intel_gpu_frequency.c:312 main()
> >   #3 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
> >   #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
> >   #5 [_start+0x25]
> > Test (null) failed.
> > **** DEBUG ****
> > [cut]
> > (intel_gpu_frequency:3142) igt_core-INFO:   #5 [_start+0x25]
> > ****  END  ****
> > FAIL (-1.000s)
> > 
> > This is a tool, not a test, so change it and allow a normal user printing current
> > Intel GPU frequencies. While at it, fix also printing program name and print
> > only program name, without a full path.
> > 
> > Cc: S Sebinraj <s.sebinraj@intel.com>
> > Cc: Xin Wang <x.wang@intel.com>
> > 
> > Kamil Konieczny (2):
> >   tools/intel_gpu_frequency: print short program name
> >   tools/intel_gpu_frequency: Allow printing by regular user
> > 
> >  tools/intel_gpu_frequency.c | 141 +++++++++++++++++++++++++++++++++---
> >  1 file changed, 129 insertions(+), 12 deletions(-)
> > 
> > --
> > 2.52.0
> 
