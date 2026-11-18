Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E096D606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 13:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mnq9gNGN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E09210FC37;
	Wed, 18 Nov 2026 13:05:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044B910FC3E;
 Wed, 18 Nov 2026 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795007076; x=1826543076;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GLTvED0Gtj+vfGiPIclRBa3cx2Xk02SkD9yhdTE3hjE=;
 b=mnq9gNGNKiXFmfMWpeXNDcfrHLgj1j3PwMXEa2QUj5C+93oklPHhkhxd
 4JPrzg8JIVpnyRz+3GOHfuNej5A7633gX0fvk/dPRoJC4QXvro3CwUiEi
 UBefn6fikqq9As+et2rvMNUUWbD/SH4eT9y2ikMFDTjEzTY5DQYOITxuK
 8A2H17QH22VF3c9RLO/LQOZhH34E8ePfnKdHEeCNps8bhyOUQ2Du7bteY
 bxWz6AdidFFhHbjqj2ihjZZfloPdvBhdmdwCfJN/T/BGLu12FcaGEfgk3
 uVPRtucOI6mrEyjvd/4fyO1PJOFXHI30rfJfqgRz7CdmOuOcHBDlLxNBz A==;
X-CSE-ConnectionGUID: wkCPZYaASEiOw8ko+zOf1A==
X-CSE-MsgGUID: 9Q3rNlHxQYKoUVJ/Ysxcjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3823504"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3823504"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:04:35 -0800
X-CSE-ConnectionGUID: JUP+FuY2R6a2PIfiy8DgmQ==
X-CSE-MsgGUID: /0DmoZniSLCihAGiSmVQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10373402"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:04:34 -0800
Date: Wed, 18 Nov 2026 14:04:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org, 
 Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 tests/core_sysfs: Create listing while reading
Message-ID: <755kjwrxskwzfskztmjfsxkc43ubhiashpoclgwzda4u6amy4f@r4ho34w2p7ov>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org, 
 Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
References: <20261117194250.72855-1-kamil.konieczny@linux.intel.com>
 <179499766653.42192.7735661872212684033@9ac1b63fe3ea>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179499766653.42192.7735661872212684033@9ac1b63fe3ea>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi igt-dev,
On 2026-11-18 at 10:27:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_sysfs: Create listing while reading
> URL   : https://patchwork.freedesktop.org/series/178819/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9196_FULL -> XEIGTPW_16167_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_16167_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_16167_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_16167_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_sysfs@read-all-entries:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/shard-bmg-7/igt@core_sysfs@read-all-entries.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/shard-bmg-3/igt@core_sysfs@read-all-entries.html
>     - shard-lnl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/shard-lnl-7/igt@core_sysfs@read-all-entries.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/shard-lnl-8/igt@core_sysfs@read-all-entries.html

These core_sysfs@read-all-entries are tests bugs introduced by
igt change, please ignore it and do not file a GitLab work-item
for them.

Regards,
Kamil

> 
>   * igt@xe_sriov_scheduling@default-enabled-fair-scheduling@numvfs-random-gt0-rcs0:
>     - shard-ptl:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/shard-ptl-5/igt@xe_sriov_scheduling@default-enabled-fair-scheduling@numvfs-random-gt0-rcs0.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/shard-ptl-2/igt@xe_sriov_scheduling@default-enabled-fair-scheduling@numvfs-random-gt0-rcs0.html
> 

These are unrelated to a change.

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_16167_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#3279])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
...cut...
