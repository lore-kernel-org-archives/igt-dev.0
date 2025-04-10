Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F76AC3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 17:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9FF10E37F;
	Thu, 10 Apr 2025 17:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFNPAewv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5628E10E376;
 Thu, 10 Apr 2025 17:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744305733; x=1775841733;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=GykWlPCJZDwaRVUF764ZlushBpFsb94IEDB3KgHtoJ4=;
 b=FFNPAewvQ2lVL+VBVniFbBNs/nByJcSL56HdJwvhM6/rmWavBJQvqZ1u
 3ZE2Ar2snIQyoZGbOZk+jv2SVbd2IFaVKGzuAnCjoj1ozwzV/dXajmR9y
 1X5ZP6mNuJ8qhLdZWVyMJWxhC0/1KZexAg+5j4LGTxiAlJiHHlRrLr1Wy
 54kEJ5z3aQWgTwoTaAG/TGQyotxNxA1YqB+PI/fYQ9DPL5UV0dxxZHTE4
 +URV5T88qufzNgNg9ih3j6xycpGFosh34gVxMS2UdJLLyU630mXiQA5Yt
 O/0qFDAgEYKDGHhwKKZbo+6Mfnn1Sqh189IoE+ESXr6PA+xqFKK1JQYl6 w==;
X-CSE-ConnectionGUID: vbfvrV1AR3GB1dqicBt7BQ==
X-CSE-MsgGUID: 4YGPEQAKRO+YDGgaLLhdDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="63238397"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="63238397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:22:13 -0700
X-CSE-ConnectionGUID: jcAzKnJaTAKgxE/jjN8fMA==
X-CSE-MsgGUID: BoL/VEAhQBm+7ThFvhmusA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134136580"
Received: from mschulfe-mobl1.ger.corp.intel.com (HELO [10.245.83.15])
 ([10.245.83.15])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:22:12 -0700
Message-ID: <15c15db2-ba8e-4862-86bf-2ba1b607cd47@linux.intel.com>
Date: Thu, 10 Apr 2025 19:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/int?=
 =?UTF-8?Q?el/intel=5Fsysfs=5Fdebugfs=3A_Remove_xe-gt?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250410090315.4201-1-peter.senna@linux.intel.com>
 <174430499416.366.9106120670242612616@32c37dd7f93d>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174430499416.366.9106120670242612616@32c37dd7f93d>
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

On 4/10/2025 7:09 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/intel_sysfs_debugfs: Remove xe-gt
> URL   : https://patchwork.freedesktop.org/series/147513/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16395_full -> IGTPW_12955_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12955_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12955_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12955/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12955_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@overlay-atomic:
>     - shard-rkl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12955/shard-rkl-1/igt@kms_async_flips@overlay-atomic.html
> 

This is unrelated to my change. Please fix and re-run.

[...]

