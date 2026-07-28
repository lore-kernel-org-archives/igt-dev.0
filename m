Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AF9C54F4C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 14:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA2C10E5B2;
	Tue, 28 Jul 2026 14:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwnprZqm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D7910E5B2;
 Tue, 28 Jul 2026 14:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785247870; x=1816783870;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XR87izXokWs4+iK/kzRvVKn2u60rv8ziv8ZH81lHKow=;
 b=WwnprZqmcSrCC/spJxgrE6Y1RTkOUigY7hrRxTIRmHZQxqLXBZ67VVzy
 vykNY06lhviAIkmwW69076i/rFiQ0+Pt6AyKFlPk92B5kHDYVu4BdIsks
 HZZ7WX6Sn7ZmW64a7z3i3MBypBYsUuLMxY4Igl0XQYCDHRBcjdiOvVqZP
 GJeyxmwmo0gD7E1i8NWqccg1rbUvtgp5qb6j6J2leXMFh80H+hO5SNJrg
 pq6+GYAk45HE1DgTNlZ9UFggLQONZRlXQeOunNSvxhwnqH8nb6rVUClTR
 CDYGyQmFtBACjPEK5jMSBTuMuVgqwDut6FbEf9knx2EDMChwRlZzwd6Dl g==;
X-CSE-ConnectionGUID: +VgNjGkYTZ+wRI1Sd72xYg==
X-CSE-MsgGUID: j1U/Xe+KSNOiC+FraenxxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85775812"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85775812"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:11:09 -0700
X-CSE-ConnectionGUID: heV5cWuASwWc5OlHZF4yDQ==
X-CSE-MsgGUID: tEGNQAtaSJuiW7jMPUGamA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="289667857"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 07:11:08 -0700
Date: Tue, 28 Jul 2026 16:11:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Robert Mazur <robert.mazur@imgtec.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests=2Fima?=
 =?utf-8?Q?gination?= =?utf-8?Q?=3A?= Add initial test coverage for
 Imagination DRM driver (rev4)
Message-ID: <20260728141105.v47wtko33hnrbbcp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Robert Mazur <robert.mazur@imgtec.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
 <178523909957.230293.10900106723407762536@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178523909957.230293.10900106723407762536@6beec6c84f66>
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
On 2026-07-28 at 11:44:59 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/imagination: Add initial test coverage for Imagination DRM driver (rev4)
> URL   : https://patchwork.freedesktop.org/series/170620/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9027_FULL -> XEIGTPW_15600_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15600_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15600_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_15600_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15600/shard-bmg-4/igt@kms_pm_rpm@i2c.html
> 
>   * igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue:
>     - shard-lnl:          NOTRUN -> [INCOMPLETE][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15600/shard-lnl-1/igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue.html
> 

This series brings non-Intel tests, so above are unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15600_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
...cut...
