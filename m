Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB45CC02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 11:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C0E10E5DB;
	Wed, 15 Jan 2025 11:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDzrS/t0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E85110E5DB;
 Wed, 15 Jan 2025 11:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736939440; x=1768475440;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mR6rNEaTw+J/Y9dwnlKN2mMSLfnk2MQZ0wLzQP/Civo=;
 b=ZDzrS/t0Y8uSbwCYYMeByeNQ5zxlu6/WXZgkqIXS8blkBLXoIvz02QO6
 FF+FE0DMyxnsCwoIJdx+l1emZJfCH0K9l122SqZLhvhmN54psN39BhSrK
 EC8I/Ml01WYgOsPZ7KHEcIodbFopN8LeuIIHpC2r7J/xRwjZtq0AFOvUZ
 xf9wKINH/Ab8N3XxNgdULtsQi3f8KHd/vb9uqfwYlB5S7OdX4agfn45XV
 NeI2dMQMpZ5ZyWBOuTBeDY384MUSuLf5F0fPURlNXkbI5HMjeK7BbG/Uh
 I/M2dA13ibJ2i5LyUThUzN0H6jQekdYMzrulNxe0/DLhrOEW4u0oYhVS2 w==;
X-CSE-ConnectionGUID: aQNt7LSYSEeXp4X27lvn0g==
X-CSE-MsgGUID: KKlcuoKlS4qwW46kSzTZfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40949436"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="40949436"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 03:10:40 -0800
X-CSE-ConnectionGUID: RG5CW4XsTSqJvi8a2WoIDA==
X-CSE-MsgGUID: hNkOpSoUROSy2HBLdR/mmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="105297483"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 03:10:38 -0800
Date: Wed, 15 Jan 2025 12:10:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Oak Zeng <oak.zeng@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/intel-ci: Fix a syntax err in xe.blocklist.txt
Message-ID: <20250115111036.hwwxo7jcgnbbg534@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250114173523.3267049-1-oak.zeng@intel.com>
 <173689927142.3758484.13032617055866397864@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173689927142.3758484.13032617055866397864@b555e5b46a47>
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
On 2025-01-15 at 00:01:11 -0000, Patchwork wrote:

none of below regressions are caused by this patch.

Regards,
Kamil

> == Series Details ==
> 
> Series: tests/intel-ci: Fix a syntax err in xe.blocklist.txt
> URL   : https://patchwork.freedesktop.org/series/143518/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8190_full -> XEIGTPW_12437_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12437_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12437_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12437_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][1] +23 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
>     - shard-lnl:          [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8190_full and XEIGTPW_12437_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@xe_copy_basic:
>     - Statuses : 1 incomplete(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12437_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-lnl:          NOTRUN -> [ABORT][9] ([Intel XE#3914])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@core_hotunplug@hotreplug-lateclose.html
> 
...cut...

>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8190 -> IGTPW_12437
>   * Linux: xe-2483-1c464719f6d86a08c91e6ed5d64db83b166788db -> xe-2485-30226b91b1754fdae425af3397c1e3dcba8264b0
> 
>   IGTPW_12437: 0f59ba31e7b6259cc30403659f79160c707f737d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8190: db6e252e00bc44f90b678d547e93b3f02c02c6de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2483-1c464719f6d86a08c91e6ed5d64db83b166788db: 1c464719f6d86a08c91e6ed5d64db83b166788db
>   xe-2485-30226b91b1754fdae425af3397c1e3dcba8264b0: 30226b91b1754fdae425af3397c1e3dcba8264b0
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/index.html
