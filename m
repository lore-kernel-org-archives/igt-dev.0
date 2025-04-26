Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97639C369CB
	for <igt-dev@archiver.kernel.org>; Sat, 26 Apr 2025 08:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B269010E045;
	Sat, 26 Apr 2025 08:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsHDVFsz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6880810E045;
 Sat, 26 Apr 2025 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745654725; x=1777190725;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=WHWvq3wUCr98G9Q1xFwpMo4eSgtBhsgUzHuX6gow83A=;
 b=UsHDVFszBTXJtCZDu92mXdjlcqgINHQPW7y6nJXupaPRLq+0U5kE2Kn6
 Mx3om9sDnLUc+dWjJNCP3GgsxqdAS4IMAPHBSmC4j9OETb0+iAkFjk44J
 WOsLex9M6AZ3gX3fKCckKaIL6awc8JJ+V0SufdhsuRnk1A7B9SYvaVrkq
 +kfrJe21EIFEd6L2iaMoU38O4yLfQBST/nxBGMU8AkyiwzV48kQzXKZqn
 5yw/sJcIRYiqv8QDXUUWLRUHof4uilTSzxfMY9hhUaIw/jgidsq4I0yOW
 CGYEM9d1791wsQ1ynQd1v/thKrg9n9WyMgTLoxwG6XlJRFAIupIg+NohK g==;
X-CSE-ConnectionGUID: WXAdoNWqRA+uD9/9N4KCHw==
X-CSE-MsgGUID: GTawnruARG26MFP/e0BhUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47195062"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; d="scan'208";a="47195062"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2025 01:05:22 -0700
X-CSE-ConnectionGUID: 6PowJuu3QC6mZ++QkMBrzg==
X-CSE-MsgGUID: CiKWElj4QGiRonyuAaC2Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; d="scan'208";a="134065960"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2025 01:05:21 -0700
Message-ID: <6acba6f5-e527-4cbc-bc8d-ed0935cab1e8@linux.intel.com>
Date: Sat, 26 Apr 2025 10:05:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_st?=
 =?UTF-8?Q?arting_with_=5Bi-g-t=2C1/3=5D_lib/igt=5Ffacts=3A_Remove_NULL_and_?=
 =?UTF-8?Q?bool_comparisions?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250425094904.221857-1-peter.senna@linux.intel.com>
 <174562602440.13625.7820820643863336092@c664b1dc75d1>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174562602440.13625.7820820643863336092@c664b1dc75d1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915,

On 4/26/2025 2:07 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/3] lib/igt_facts: Remove NULL and bool comparisions
> URL   : https://patchwork.freedesktop.org/series/148254/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16464_full -> IGTPW_13043_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13043_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13043_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13043/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13043_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_render_copy@linear:
>     - shard-dg1:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16464/shard-dg1-16/igt@gem_render_copy@linear.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13043/shard-dg1-12/igt@gem_render_copy@linear.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13043/shard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html

These are unrelated to my change.

Thank you,

Peter
