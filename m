Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB3CC71155
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 13:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181B110E38D;
	Mon, 16 Jun 2025 13:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNcfr9Hi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC76610E38D
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 13:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750080698; x=1781616698;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WjbPH/Jve/e45T85iSEW8uSL1fcCLi4Ha8zW0cL99RU=;
 b=eNcfr9HijLY8Kpb9UTVO0XUj/2aV69oJZAvmDIk94KPiz5JXHY5haI+G
 /hucYtYyffrRgA3ZKOZkMM10hoQ355X+obvoB4PqIn5TPxZTp1bCjI/Ue
 xITRwpIxIea8N3OLh9WmyEeSqC1WVvdV73McdNZ06lsxkpWZaX5vXgQq1
 G5ULXQl9EMUUANqisFBRLQyLZ3knJrE4H1O2P2gVh1BHcceHl6iECg2W/
 +w6MaSeM31599ewvTbZEU1tX8o1c36OvuDOyyDVCg2dm/sqrbNBSCsOqc
 KPxE3fb1IlifAREskimaQ3/K6s1OTzv1fRZbsfSQ5hMiimAMwXkIr6iqw A==;
X-CSE-ConnectionGUID: 9Egoq0fvT+Kus2HqZlS19A==
X-CSE-MsgGUID: hIFz4l8LSh2JaTzBw6RGvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52312608"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="52312608"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 06:31:38 -0700
X-CSE-ConnectionGUID: kI8zHkxdQFS2Gq2tRsk7EA==
X-CSE-MsgGUID: 9WpThw/RQ4mMCr+ORZWROw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148845632"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 06:31:36 -0700
Date: Mon, 16 Jun 2025 15:31:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 gitlab-ci: correct meson setup commands
Message-ID: <20250616133134.aghtd4hzhu3ffi32@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20250613-meson_setup-v1-1-47a3e06c5e9d@intel.com>
 <174995978203.80181.1759789331815636179@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174995978203.80181.1759789331815636179@1538d3639d33>
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
On 2025-06-15 at 03:56:22 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: gitlab-ci: correct meson setup commands
> URL   : https://patchwork.freedesktop.org/series/150234/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8411_FULL -> XEIGTPW_13292_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13292_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13292_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13292_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [PASS][1] -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13292/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
> 

Unrelated

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13292_FULL that come from known issues:

...cut...

