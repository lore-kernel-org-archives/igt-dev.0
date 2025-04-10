Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36557C369A2
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 17:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ED110E379;
	Thu, 10 Apr 2025 17:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5w1m8n/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFE410E14B;
 Thu, 10 Apr 2025 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744307910; x=1775843910;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/aH+PVtOpjanlqvzfEcaU7muDSvEV7ijH/PcCs082Lk=;
 b=Q5w1m8n/ykBDQ9YjNbcEhmaR7r6blijizMHr6xR8EATf/QioN6R6AD1b
 uXgVqC5+Lr1m57ARAdybHGOtPPxEsHy833AhDHl0GLGYEBBGFEASkzLeX
 R4gYuP8QqxgWq4nJRYQUMvujrYnVBalQflZB14EzCaN1r9JrVlclKqoWc
 LfhYpQbMVubQan2nKflVEdNOEbKZYcX91QGfv/S7L4rERpMa1sx/8OUVi
 LTH2oLDOizGoN+vM8phdNZWo+w3GyqaD1Qo055111mOZdcxQqghrESm6e
 V+8pm7p9jWx3CC/NAVRxMDXwYvxg1HM6D66jquM+ARlMMZrrcSxTxYnoj A==;
X-CSE-ConnectionGUID: pkHTuehfS9SEFxbr6Csl5g==
X-CSE-MsgGUID: eHknO1jsQVu7dxT74PDeKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="63386788"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="63386788"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:58:29 -0700
X-CSE-ConnectionGUID: 5sXGgkOOSi6JCb5j3gS6Lw==
X-CSE-MsgGUID: 7uKn3AHqT5SryvdLIMyhUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="128939966"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 10:58:28 -0700
Date: Thu, 10 Apr 2025 19:58:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 Runner: sync files and dirs after execution (rev2)
Message-ID: <20250410175825.e4aplr7pl5ndo7v5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250410100537.61489-1-kamil.konieczny@linux.intel.com>
 <174429791264.153.7499240431625604207@32c37dd7f93d>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174429791264.153.7499240431625604207@32c37dd7f93d>
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
On 2025-04-10 at 15:11:52 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Runner: sync files and dirs after execution (rev2)
> URL   : https://patchwork.freedesktop.org/series/147466/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8313_FULL -> XEIGTPW_12957_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with XEIGTPW_12957_FULL need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12957_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12957_FULL:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2-set2:     [ABORT][1] ([Intel XE#2705]) -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8313/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12957/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [ABORT][3] ([Intel XE#4502]) -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8313/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12957/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 

Unrelated to igt_runner change.

Please note that this should help somewhat reduce number
of incomplete tests.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12957_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#3767]) +15 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12957/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

...cut...

> Build changes
> -------------
> 
>   * IGT: IGT_8313 -> IGTPW_12957
>   * Linux: xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8 -> xe-2929-e74ca4100a9da8d41d1024e16165f7fe17f09427
> 
>   IGTPW_12957: 16da6279b7c028e3621ad1931364ebb9bd60921f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8313: 8313
>   xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8: c54633598106dbdb97f3aa589587b8176009b6d8
>   xe-2929-e74ca4100a9da8d41d1024e16165f7fe17f09427: e74ca4100a9da8d41d1024e16165f7fe17f09427
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12957/index.html
