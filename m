Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C596CD4F25
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 15:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F6110F560;
	Fri, 15 May 2026 15:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzW41iIn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCB810F563;
 Fri, 15 May 2026 15:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778857644; x=1810393644;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L5Y7SBJonAh+fITDLp07ilO+9UdivoY/2NvVg+9C8jw=;
 b=HzW41iInPzjEx7sOEgDyUD2qCALfzK0LsyDGd9Y6mingKZTpVUaPQk+t
 OtCk4bbke0zTQXZ22i/ONHrrP+CW1ueUzt1HHFkiXP308iGS6lNviKDNX
 aAeiSN6WhqIsOM9jTMgONOb1GpHGz5yr5d8IT21lm5oEw9ylQp+JetmjN
 Mq7x6ed9aW+uQIe6Xi5w26YBbcBt3C/8JoJs7YwrxDXz//nrt9hatFvEF
 mZqevxnu+g5TMkfURbGPbqwR6YF73T5kJnwY3k3DULeAkP3YiJB2OqoIO
 vPv0EWnvLt3KA0bI6DlySG0Xc17qgBHrB8cdwIB0VbQxwnJi1eb2AZLB/ Q==;
X-CSE-ConnectionGUID: YbrNOlIaRW2jpILv3C1SNQ==
X-CSE-MsgGUID: 4VMuRhJzRqSetxkN5TAedQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79530961"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79530961"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 08:07:24 -0700
X-CSE-ConnectionGUID: 4vdFj8GZSp+GagwCQ+bOPA==
X-CSE-MsgGUID: WUoUWn67SKWs4PVWVqcd6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="234463705"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 08:05:36 -0700
Date: Fri, 15 May 2026 17:05:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests=2Fv?=
 =?utf-8?Q?3d=5Fperfmon?= =?utf-8?Q?=3A?= Fix V3D 7.1 regression and extend
 perfmon testing (rev3)
Message-ID: <20260515150516.py2qoi25opkvlyss@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260514201637.1811428-1-mcanal@igalia.com>
 <177885258980.75062.14468219060297062156@5ab824fced77>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177885258980.75062.14468219060297062156@5ab824fced77>
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
On 2026-05-15 at 13:43:09 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/v3d_perfmon: Fix V3D 7.1 regression and extend perfmon testing (rev3)
> URL   : https://patchwork.freedesktop.org/series/166215/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18491_full -> IGTPW_15186_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15186_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15186_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15186/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15186_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-rkl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15186/shard-rkl-2/igt@i915_query@query-topology-known-pci-ids.html
> 

Unrelated to xe/i915, these changes were in v3d tests.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15186_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][2] ([i915#8411]) +1 other test skip
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15186/shard-dg2-1/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#14544] / [i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15186/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15186/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8411])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15186/shard-mtlp-6/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
...cut...
