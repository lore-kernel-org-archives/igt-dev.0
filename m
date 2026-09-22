Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5E0C982FA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 15:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E6B10ED9C;
	Tue, 22 Sep 2026 15:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESujwXhj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B6710E71E;
 Tue, 22 Sep 2026 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790092597; x=1821628597;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JgKG4ji4548chdp0gc0Ilootyj0nawGlcersZw2wb34=;
 b=ESujwXhj6M2lTNXCM+S9rjIXyG38FOVwCVtYxTaL9VsnFYoNcnRQpSRJ
 HAFrbNOPd2tLofZKjfh6ZODJLBKp/vfyGugxR0HxIHvCqfX+nWnDjWf0w
 BFt9Y5LigfZ4GbXkZi4atklp8S0321l4Ypjv8hTySZLXKL7mGYxtYKOS4
 cAHaFje1qpiRSrQUbQbQp9a7Gcc2oJYup/GkZWGcOgmOoyviWcxwS9mCV
 tTS1FeXFbom+AVZwaKNV6VWDUyzrRMUc8fl3YkqaUmru8oL9ZcPqfoslB
 SSyZGHSmvGrtLMm4mynVXMo17Fxt/UcLH8yWAb8gcX528HPY7WjSPANI9 w==;
X-CSE-ConnectionGUID: ZcNAw9JKRg6okZK5cbMdVQ==
X-CSE-MsgGUID: RxigmOtoQkWAd/XsxsjDtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101297048"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101297048"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:56:37 -0700
X-CSE-ConnectionGUID: kjAwUyXBQmOQRaVVtNwAMw==
X-CSE-MsgGUID: ipg/kZ76QUG+2Jb6ZbUh6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272393488"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 08:56:36 -0700
Date: Tue, 22 Sep 2026 17:56:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 tests/panthor: skip sparse VM_BIND tests before v1.9 (rev2)
Message-ID: <20260922155633.qopjfk3nyzzvn2zi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260921-b4-panthor_version_sparse-v3-1-c0af288ca073@collabora.com>
 <179004854369.190304.17777963192594177847@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179004854369.190304.17777963192594177847@61270ab9df2a>
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
On 2026-09-22 at 03:42:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/panthor: skip sparse VM_BIND tests before v1.9 (rev2)
> URL   : https://patchwork.freedesktop.org/series/174552/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9105_BAT -> XEIGTPW_15878_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15878_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15878_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (15 -> 15)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15878_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@twice-free:
>     - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9105/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15878/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-basic:
>     - bat-bmg-3:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9105/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15878/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
> 

Unrelated, this is non-Intel test change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15878_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
>     - bat-bmg-1:          [DMESG-WARN][5] -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9105/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15878/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
> 
>   * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
>     - bat-bmg-3:          [DMESG-WARN][7] -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9105/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15878/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
> 
>   * igt@xe_waitfence@engine:
>     - bat-ptl-2:          [FAIL][9] ([Intel XE#9109]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9105/bat-ptl-2/igt@xe_waitfence@engine.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15878/bat-ptl-2/igt@xe_waitfence@engine.html
> 
>   
>   [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9105 -> IGTPW_15878
>   * Linux: xe-5799-42735b6937d60963dd302128231fb74a18164a60 -> xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04
> 
>   IGTPW_15878: 15878
>   IGT_9105: 9105
>   xe-5799-42735b6937d60963dd302128231fb74a18164a60: 42735b6937d60963dd302128231fb74a18164a60
>   xe-5801-dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04: dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15878/index.html
