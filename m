Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26FFD4660D
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 18:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E85510E04E;
	Thu, 15 Jan 2026 18:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLXNlngM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F8610E04E
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 18:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768502173; x=1800038173;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=4ZgHDmgaKvEhTj0tLo2TlcZ00BFTWhTQhODGOkdmTEE=;
 b=gLXNlngMdP8gebb5Ep89MR+J7SoUmFE0Sw5BXdJj7e83m7fYOiBAhk5a
 0xntClVrK9Kc4UHY6wLq0xNsPZwvGW49h+dRaiAAxCSd2V/MG9h8Ci4I4
 zaBPeqdHFwus4YwJvdtGQTGH4POiy40ZJFXvZNztBE+VkOyWFiPCr8m6n
 gSo8nJQR66zEbZbM+d3wRJ893x0zXCJ4iSE+4d0PIMmOQQfKD8tApp91E
 qSYYI+I6tjWcyJzh/xFEZeAFJYqrb/HUWLIAxGDzQbkQSiF37mT5klChY
 GGNIbl9SjcudsPGsmMkt6Cb3h/XSaRWHBA2QdYSmkuly6QX6oasGw4GPl A==;
X-CSE-ConnectionGUID: byxegVWCRPWfnjGTy7+HAg==
X-CSE-MsgGUID: jstolI3vQJmfJFoxnNkEjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69907636"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="69907636"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 10:36:13 -0800
X-CSE-ConnectionGUID: DvaxfuSCS0ihidpZSjUDgA==
X-CSE-MsgGUID: xkzOeFqXQiij/Tb/CtLw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205082843"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 10:36:12 -0800
Date: Thu, 15 Jan 2026 19:36:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 RFC: cut successful dmesg logs (rev2)
Message-ID: <20260115183609.xpwceflxoi7wcwwi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260115125732.20542-1-kamil.konieczny@linux.intel.com>
 <176848948465.158821.9627968054287168312@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176848948465.158821.9627968054287168312@a3b018990fe9>
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
On 2026-01-15 at 15:04:44 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: RFC: cut successful dmesg logs (rev2)
> URL   : https://patchwork.freedesktop.org/series/159973/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8701_FULL -> XEIGTPW_14348_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14348_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14348_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_14348_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +4 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8701/shard-lnl-4/igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14348/shard-lnl-5/igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>     - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8701/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14348/shard-bmg-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 

Unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14348_FULL that come from known issues:
> 
...cut...
