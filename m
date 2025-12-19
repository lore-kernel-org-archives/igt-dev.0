Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8889CD74976
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 09:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3479110E0ED;
	Fri, 19 Dec 2025 09:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONVuXXGX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBBD10E0ED;
 Fri, 19 Dec 2025 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766138326; x=1797674326;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QnDVRNyGuSx62w2rl0lPkZ7ss6+2KTsnlRoyrgFGfKs=;
 b=ONVuXXGXSHotb1aqovyeY8XUEtS6h37rrjV2YOIQMDq9mtbTfafUMWjz
 OMYzdgF7vV548tYEVl6GTR8eglg1hLA7SZf5msq7JXtjKHjm25a7rRlZp
 MQAPxkORg+FjEd3ErK/+YJG9qOhzEPpDRPo3iVzGUIbva3d4xoLjLC1TK
 zBFUrp3p945M1sBjqALF/KZHSce8G1AKUAt97NvuDx4LGVogfYPiA1UBT
 SpvTmqMHBDt0gOWE5J7IMFL31Ga0a6KJ9tiDVfM0M0JxNhueAA2unQjoR
 FjGt+d8gTiBl7lDuqLTLVBsnGOL4DQWA9PwejCOWFmbeqMR0D/T2/Oii8 w==;
X-CSE-ConnectionGUID: 2uGwZSqgSaSvZrLEZrobiQ==
X-CSE-MsgGUID: Elua11qJTdmYDUg987HLWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945175"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="71945175"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 01:58:45 -0800
X-CSE-ConnectionGUID: RynNR7ZHSYWemGJugochjw==
X-CSE-MsgGUID: GDFTkDU7RDqd2/Z+JnqnLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="197973411"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:44 -0800
Date: Fri, 19 Dec 2025 10:58:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Panthor tests for huge partial unmaps (rev3)
Message-ID: <20251219095825.fforpargciom3gtv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20251217215909.710730-1-adrian.larumbe@collabora.com>
 <176609732861.103426.8321424318566734317@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176609732861.103426.8321424318566734317@a3b018990fe9>
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

Hi igt-dev,
On 2025-12-18 at 22:35:28 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Panthor tests for huge partial unmaps (rev3)
> URL   : https://patchwork.freedesktop.org/series/158975/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8670_FULL -> XEIGTPW_14232_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14232_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14232_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14232_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_getversion@basic:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@core_getversion@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@core_getversion@basic.html
> 
>   * igt@core_setmaster@master-drop-set-root:
>     - shard-bmg:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc-race:
>     - shard-bmg:          NOTRUN -> [DMESG-FAIL][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc-race.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          [SKIP][5] ([Intel XE#6703]) -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html
> 

Unrelated to non-Intel change,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14232_FULL that come from known issues:
> 
> ### IGT changes ###
...cut...
