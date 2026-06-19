Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ECCCD98F2
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 12:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA43210F592;
	Fri, 19 Jun 2026 12:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdbypAYA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FA910F585
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781871968; x=1813407968;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fLDtlOibKbA/ztl3v1u0dBDsrjAyzP1Q+m4TW6iglWs=;
 b=UdbypAYA6vitwpp8o0ZtQm38TIbVZmCLFsVeeZpm1szbCkN19u0klzsB
 FQM1pkIl0kE/LORfTIZJU7kgH4O4wBESrYs2XrYNXXYzLL+Earxn+6Qpu
 m0p5JYOs9t9Q0m6e2VIDilhiyQrjU+9MfGjQeRWPiVU9mN0fURbh8B+5O
 TCYzc3Yp2i8vdOK2RPfa68bC3meuz8+J8dpPX58lZv4LO1aQVZ1P+8Fm4
 AumpqiZWnOJkaPhsBgTuzPGSDbiTegGYkfj8XvARxHj4XS6+jmkImhRF0
 r+dEaq1pg8V5EQvqRgg3ZNDVXa3nSpKMgWO38AEdBFxaSwkoJm6KjsMyr Q==;
X-CSE-ConnectionGUID: 2BdPAGOSRq+tNaQprDq91Q==
X-CSE-MsgGUID: Vh70eWBpSU2IA6nxT23IUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="93372591"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="93372591"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 05:26:07 -0700
X-CSE-ConnectionGUID: fj62uPDeQ4WUYWOjD3jUXg==
X-CSE-MsgGUID: /uz4pe8ASpCMKZV/vrLSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="248676767"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 05:26:05 -0700
Date: Fri, 19 Jun 2026 14:26:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org, francois.dugast@intel.com,
 zbigniew.kempczynski@intel.com, priyanka.dandamudi@intel.com,
 niranjana.vishwanathapura@intel.com
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_intel-ci?=
 =?utf-8?Q?=3A?= Add SVM, multi_queue tests to Xe fastfeedback (rev8)
Message-ID: <20260619122603.wqy3qvtmhox5b6kq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 igt-dev@lists.freedesktop.org, francois.dugast@intel.com,
 zbigniew.kempczynski@intel.com, priyanka.dandamudi@intel.com,
 niranjana.vishwanathapura@intel.com
References: <20260618051522.7910-1-venkateswara.rao.muppidi@intel.com>
 <178176261059.92208.16309373096721680762@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178176261059.92208.16309373096721680762@6beec6c84f66>
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

Hi Rao,
On 2026-06-18 at 06:03:30 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Add SVM, multi_queue tests to Xe fastfeedback (rev8)
> URL   : https://patchwork.freedesktop.org/series/168562/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8972_BAT -> XEIGTPW_15395_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15395_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15395_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 

Please look into those failures (skips) and if they are expected
please add them to blocklists for each platform.

+cc other devs

Regards,
Kamil

>   
> 
> Participating hosts (13 -> 13)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15395_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>     - bat-adlp-7:         NOTRUN -> [SKIP][1] +17 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15395/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> 
>   * igt@xe_exec_multi_queue@exec-sanity:
>     - bat-bmg-1:          NOTRUN -> [SKIP][2] +13 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15395/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html
> 
>   * igt@xe_exec_multi_queue@many-queues-basic:
>     - bat-ptl-1:          NOTRUN -> [SKIP][3] +13 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15395/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html
> 
>   * igt@xe_exec_multi_queue@many-queues-basic-smem:
>     - bat-lnl-2:          NOTRUN -> [SKIP][4] +13 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15395/bat-lnl-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
>     - bat-ptl-vm:         NOTRUN -> [SKIP][5] +13 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15395/bat-ptl-vm/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
>     - bat-atsm-2:         NOTRUN -> [SKIP][6] +32 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15395/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html
> 
>   * igt@xe_exec_multi_queue@many-queues-priority:
>     - bat-ptl-2:          NOTRUN -> [SKIP][7] +13 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15395/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html
>     - bat-wcl-1:          NOTRUN -> [SKIP][8] +13 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15395/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html
> 
>   * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
>     - bat-wcl-2:          NOTRUN -> [SKIP][9] +13 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15395/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html
>     - bat-bmg-vm:         NOTRUN -> [SKIP][10] +13 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15395/bat-bmg-vm/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html
> 
>   * igt@xe_exec_multi_queue@priority:
>     - bat-lnl-1:          NOTRUN -> [SKIP][11] +13 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15395/bat-lnl-1/igt@xe_exec_multi_queue@priority.html
>     - bat-bmg-2:          NOTRUN -> [SKIP][12] +13 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15395/bat-bmg-2/igt@xe_exec_multi_queue@priority.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15395_BAT that come from known issues:
[cut]
