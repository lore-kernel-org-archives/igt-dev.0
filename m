Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD1ED74EED
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 15:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164AF10EB1C;
	Fri, 23 Jan 2026 15:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vr8LN3iI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B0010EB1B;
 Fri, 23 Jan 2026 15:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769183037; x=1800719037;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8mwd0UxpjrUrYIoR8mxzKqYVEh3gLA26lxjU6wf75TY=;
 b=Vr8LN3iI5KqqmnvUzSrUYm7/sqcNoABDPvw2pBl13vVcXzE/+hlfurQR
 djgn27kr3frVqGnlqJAUrs0Ci2X09BBDv8VCEPJ+RhOnkETYI5oZQNjXg
 d7qB0VWC91fyHOO5E9ZnxBHGVUvx5Uu37mIIBB7SgKlwi52U6F5acxKHL
 KrL+qcwSOEhkjN2KuBaGPmN2Cy2Wccu+tkPyA/yyKH8FAVxB8lhegRq3a
 vCk6tGsqVtY4l6hy7LBzCHxsu5bEcyQp24SsyvBwcuJtnC4Q0KFueE5xj
 LYX4l90gLOPEzDPLixt4L+/vFOip1UXcObyMZlPGHVJxaB41vQjNJzSsa g==;
X-CSE-ConnectionGUID: i1OKFrpBR3awt4FoJTLYVw==
X-CSE-MsgGUID: BUodT3RMSoOM+OigXfEcyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="95906352"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="95906352"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 07:43:56 -0800
X-CSE-ConnectionGUID: J03bebxOQTCFBo139lPo9Q==
X-CSE-MsgGUID: kqkGjjE2QHmEIfis+9y4/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207305956"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:43:55 -0800
Date: Fri, 23 Jan 2026 16:43:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Runner: Use Jansson instead of json-c (rev2)
Message-ID: <20260123154338.5aze6sa7wq52rv43@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
 <176895418981.174545.7148760047748286239@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176895418981.174545.7148760047748286239@a3b018990fe9>
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
On 2026-01-21 at 00:09:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Runner: Use Jansson instead of json-c (rev2)
> URL   : https://patchwork.freedesktop.org/series/160154/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8705_full -> IGTPW_14368_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14368_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14368_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14368/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14368_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-dg1:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8705/shard-dg1-14/igt@gem_lmem_swapping@smem-oom.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14368/shard-dg1-12/igt@gem_lmem_swapping@smem-oom.html
> 

Unrelated, no need for respin.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8705_full and IGTPW_14368_full:
> 
> ### New IGT tests (3) ###
> 
>   * igt@i915_pm_rps@blit-reloc-purge-cache:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@engines-basic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@y-tiled-addfb-size-overflow:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14368_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####

...cut...
