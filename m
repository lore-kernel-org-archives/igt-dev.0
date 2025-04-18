Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E323DC369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 13:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA4810E081;
	Fri, 18 Apr 2025 13:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFZJjGgK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EF610E1FA
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744982042; x=1776518042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uqsRQb4ppBGN01rdbUcQoxIPfSR7ecvAvEa6IRaOqKI=;
 b=ZFZJjGgKQ+H5bgazkxQ1mKJcGqtWQvDsssrkv1iOc6JYoRvsKnCVSbZ7
 tjphMYYFCSUrA7MPveP/wr0QbNx+trRaq9c5k1bPvrL9NUJ3LsR6ehYEP
 6uHH7UvkR00JZxxGB2uDCspJmlPrxPvl2chaxRuBHYKIqyhq8fcwmGNVs
 8FmeLxYAuWkGW0Wnxkp1zzlLbD4WCy12pGry1vHhsHVn0JGH9PTQSj/yd
 3HDPfLbfY4qsREt7hh+/J5LdU0JgXSlbwIHYsPdEKJhWFFoQ7mbicvZOv
 C0pudKpJ3FAVo1Z4vWsKYSuMofCQAJQQqRRa6m9C2brNRL0AeAPM5/sRX w==;
X-CSE-ConnectionGUID: 816OmZ/JTnGU6shRM5Sgdw==
X-CSE-MsgGUID: /domr8m0TwS7/kCAyRSy4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="64013989"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="64013989"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 06:14:01 -0700
X-CSE-ConnectionGUID: n+RkocLLRbeexPfymG2y4w==
X-CSE-MsgGUID: b11zjDeDR5So6411hmCyDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="136212696"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 06:13:59 -0700
Date: Fri, 18 Apr 2025 15:13:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: Re: [PATCH i-g-t v2 2/2] lib/amdgpu: Implement priority and secure
 flags for user queues
Message-ID: <20250418131342.cewyvukt4l4qj5sj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>,
 igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
References: <20250418022918.623643-1-jesse.zhang@amd.com>
 <20250418022918.623643-2-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418022918.623643-2-jesse.zhang@amd.com>
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

Hi Jesse.zhang,
On 2025-04-18 at 10:29:18 +0800, Jesse.zhang@amd.com wrote:
> From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>

imho you should have space instead of dot:

> From: Jesse Zhang <Jesse.zhang@amd.com>

See also below.

> 
> This patch adds support for queue priority levels and secure queue
> creation flags in the user queue interface. The changes include:
> 
> 1. Extended the amdgpu_ring_context struct to store queue priority
> 
> 2. Modified amdgpu_user_queue_create() to:
>    - Parse and pass through priority flags from context
>    - Handle secure queue flag
>    - Include flags in queue creation IOCTL calls
> 
> The priority levels allow workloads to specify different scheduling
> priorities, with HIGH priority restricted to admin-only use. The secure
> flag enables creation of queues that can access protected content.
> 
> This matches the corresponding libdrm changes in commit fdf384d4b546
> ("amdgpu: add priority and secure flags for user queues").
> 
> add both the conditions under one if (ctxt->secure) (Sunil)
> 
> Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>

Same here, please configure your git global config with
something like (in your home ~/.gitconfig):

[user]
        email = Jesse.zhang@amd.com
	name = Jesse Zhang

Please use this also in your first patch.

One final note at end.

> Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.h  |  1 +
>  lib/amdgpu/amd_user_queue.c | 16 +++++++++++-----
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 231098eb8..7d48f9107 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
>  
[...cut...]
> -- 
> 2.25.1
> 
This looks old, please update your git to somewhat newer version,
on my current machine:

git --version
git version 2.49.0

Regards,
Kamil
