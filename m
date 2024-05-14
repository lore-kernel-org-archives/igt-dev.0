Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B9EC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 19:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0B010E8F9;
	Tue, 14 May 2024 19:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NC1ZkrsH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B1910E8F9;
 Tue, 14 May 2024 19:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715714733; x=1747250733;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YlGju7rpmiKhy4D/czUe8C2ACLZTh/Dl0L7qVjjArfw=;
 b=NC1ZkrsH8tH0z1BVysXgkixXrVIqotJ0TMVAvRbV6Z7gHixwp7q9m6Uy
 sG+1y0x9+DEzbiYJfDvrAe5het5r7PVGzkCwgh8EwcX9saT806WM62qo3
 ZULzKFl0HAN/zrHBZSi8rzyG0eAw4UlDNqQ/0Kn2ARTVE2QqzTQUU02Aq
 LYOkh2PbGcBCIlC8r+uPeuBB6K/nMza9kDgdsCKQczJ17NDcsZmUlhAjW
 9zW/axSCr3GXInpXTNDLbML3GLdF+RZuHWuTXTWjhsqx+4IwgOtJ9/CcH
 4G0CWYNcr3Sot91v979kSANPoyG7MUK/8DsH2iXMk7AXejsa7nXOczUHo Q==;
X-CSE-ConnectionGUID: ws968AjtTuOoMjgyZvXTQQ==
X-CSE-MsgGUID: soMS6SpqSq6Tzacks7lDQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="14666054"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="14666054"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:25:32 -0700
X-CSE-ConnectionGUID: qvaPMCowRwGWsB9+p5avbw==
X-CSE-MsgGUID: 10uCnl/DQ6SDwua2kRAl0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35574132"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 12:25:31 -0700
Date: Tue, 14 May 2024 21:25:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 lib/igt_kms: add retry loop in igt_enable_connectors()
Message-ID: <20240514192513.kauf4n33jrt7w7qf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240514094957.862770-1-luciano.coelho@intel.com>
 <171569139338.2115149.9866556298923750324@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171569139338.2115149.9866556298923750324@8e613ede5ea5>
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
On 2024-05-14 at 12:56:33 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_kms: add retry loop in igt_enable_connectors()
> URL   : https://patchwork.freedesktop.org/series/133597/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14759_full -> IGTPW_11140_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11140_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11140_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11140/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11140_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@guc:
>     - shard-mtlp:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14759/shard-mtlp-4/igt@i915_selftest@live@guc.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11140/shard-mtlp-5/igt@i915_selftest@live@guc.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-dg2:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14759/shard-dg2-1/igt@i915_selftest@live@hangcheck.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11140/shard-dg2-5/igt@i915_selftest@live@hangcheck.html
>     - shard-dg1:          [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14759/shard-dg1-13/igt@i915_selftest@live@hangcheck.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11140/shard-dg1-13/igt@i915_selftest@live@hangcheck.html
> 

Change is unrelated to these seltests fails.

Regards
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11140_full that come from known issues:
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7850 -> IGTPW_11140
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14759: b27285c06de4a6ca7b065e035f0bb06887de2f27 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11140: 11140
>   IGT_7850: 7850
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11140/index.html
