Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6C8E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 11:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E4410E5C9;
	Tue, 10 Dec 2024 11:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="caUKCdSr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC2E10E392;
 Tue, 10 Dec 2024 11:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733829903; x=1765365903;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ojvX9THhqAOZJWMBlUm+aL8hxV9MkHZ6Kvdd9BYz59c=;
 b=caUKCdSrRmTJwGZPFCNGvUnADB76PtFDGImZld71bO0SmLj1IttV8OnQ
 lViyPZ5NXnikctpac/VDo+K8C7YZ+5Eve12i6zFcks8e2q5lWRe12zoTA
 MG+ZvLvkfCU4TQ1VUgW+/Z2fq3BEXIHSAoMkS3f34ybCJeKpAds4WT97z
 Pb538TY+KudqlGzHxENrQSghpXYCyPBf0rjARAAK4R3Uu7nNAXoQ+IblS
 rZMhalObOsSikmw3svQdB0Q7oODv2LVs+YSdufnbKJbWdX7mtRMJbOXmX
 ZafWNnafr4t5Rv4YmHoP+SnESmJAq/WgKoYSqjOV+JI+lKonw0iPCMxJn w==;
X-CSE-ConnectionGUID: ok/ib7EfQviTOGoFDuZzYA==
X-CSE-MsgGUID: UTLGWkM9RryatIA2Gle5Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="21753177"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="21753177"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 03:25:03 -0800
X-CSE-ConnectionGUID: wVjSol1JSU2cp1jJBfqoqQ==
X-CSE-MsgGUID: WLBE1Va6RMuBgnh/3vTqTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95831196"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 03:25:01 -0800
Date: Tue, 10 Dec 2024 12:24:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/intel/xe_mmap: fix assert_caching on small-bar
Message-ID: <20241210112458.nox4psb5mp3vitha@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241122164730.326543-1-matthew.auld@intel.com>
 <173241836763.2295444.10242686638902181437@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173241836763.2295444.10242686638902181437@b555e5b46a47>
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
On 2024-11-24 at 03:19:27 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_mmap: fix assert_caching on small-bar
> URL   : https://patchwork.freedesktop.org/series/141710/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8123_full -> XEIGTPW_12180_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12180_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12180_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12180_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

Below regressions are unrelated to xe_mmap test changes.

Regards,
Kamil

> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ac-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12180/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@blocking-wf_vblank@a-edp1:
>     - shard-lnl:          [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8123/shard-lnl-3/igt@kms_flip@blocking-wf_vblank@a-edp1.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12180/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-panning-interruptible@d-dp4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12180/shard-dg2-435/igt@kms_flip@flip-vs-panning-interruptible@d-dp4.html
> 
>   * igt@xe_exec_basic@many-execqueues-null:
>     - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +4 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8123/shard-bmg-4/igt@xe_exec_basic@many-execqueues-null.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12180/shard-bmg-6/igt@xe_exec_basic@many-execqueues-null.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-bmg:          [SKIP][7] ([Intel XE#1130]) -> [ABORT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8123/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12180/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
> Known issues
> ------------
> 
...cut...

>   Here are the changes found in XEIGTPW_12180_full that come from known issues:
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8123 -> IGTPW_12180
>   * Linux: xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a -> xe-2264-2d0d734c211b36125b27eceb42aceac394d4f377
> 
>   IGTPW_12180: 4095ce9bfaff0948dae68be7d0c2383f918ba4c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8123: fb343db7fc59c760ef0a0c19303e7bcec177dbd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a: a381faddbfc974e7bd57efe953a738415afccd6a
>   xe-2264-2d0d734c211b36125b27eceb42aceac394d4f377: 2d0d734c211b36125b27eceb42aceac394d4f377
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12180/index.html
