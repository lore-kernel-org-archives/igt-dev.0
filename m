Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06184C71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 13:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E0910E38D;
	Mon, 16 Jun 2025 13:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDBeDtYi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAC010E39C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750080648; x=1781616648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+DIuytQyuo/7fVRlhCtzAvsCh45eRE7SQxlHaPfev3M=;
 b=bDBeDtYiKLQJGomhsQDHbiZLO6DT6XFxGwRfthpiP3tl+jW1FEyBqZYH
 brhXjwdScHmW78LL0p+xBQ7OGUfKj3JC7ASLX8HHMioQ62nzaqBASA/z6
 JczZzuEVMdGaeeRnIuu3VdvZjgoJr1zCQdj5GQ+zc7eBzNVewWLXX2ShW
 B80ZOc/MM7DxpKFHb5Vryn4s90L0K1bJRB/m3G9usCfYOcw8F09bYNeri
 RfArJi4Nhu/z72OidhVFTEcl4QsfqOB7qHHIBhYEEdb1x49tt69msv+x+
 Kvv8dI1Qu97qcgV8xcy/gXd+cWZw665KS7v9zis19WNaqNM3VFjlcVx11 w==;
X-CSE-ConnectionGUID: 7CKhbah0T06vJifxW/iDZQ==
X-CSE-MsgGUID: R13eta0BRXi3QverE72sBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69668105"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="69668105"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 06:30:48 -0700
X-CSE-ConnectionGUID: aHjerOgXRXOPhf1RzkAUkA==
X-CSE-MsgGUID: pMslF/yMQ/6xwiY4i9ypNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148312526"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 06:30:46 -0700
Date: Mon, 16 Jun 2025 15:30:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 gitlab-ci: correct meson setup commands
Message-ID: <20250616133030.glo2gcsnmnmwaj2x@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20250613-meson_setup-v1-1-47a3e06c5e9d@intel.com>
 <174983671732.77919.9848204302741816690@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174983671732.77919.9848204302741816690@1538d3639d33>
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
On 2025-06-13 at 17:45:17 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: gitlab-ci: correct meson setup commands
> URL   : https://patchwork.freedesktop.org/series/150234/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16702_full -> IGTPW_13292_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13292_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13292_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13292/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13292_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_schedule@deep@bcs0:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16702/shard-dg2-7/igt@gem_exec_schedule@deep@bcs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13292/shard-dg2-1/igt@gem_exec_schedule@deep@bcs0.html
> 

Unrelated to change in .gitlab-ci.yml

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_16702_full and IGTPW_13292_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@i915_pm_rps@fence-restore-untiled:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13292_full that come from known issues:

...cut...

