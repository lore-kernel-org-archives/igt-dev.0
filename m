Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E22C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 16:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ABA11A628;
	Thu, 25 Apr 2024 16:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZ404WQy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6460E11A626;
 Thu, 25 Apr 2024 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714063491; x=1745599491;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8k0QpzJjGD4FylCdlygDlV9LrzMmLEh9EjytcKfKeIU=;
 b=aZ404WQyE5pp0Gkp5koMTYFxDLmFlyvwNDEUxemZXU8EKv+Uvw7wkpsQ
 SeZJY8s+5UCfnckgomumgwZQ1oai/TTiayBD9IG5ExROQjiTlndiUNWRZ
 HKGS+FnFKxoFyyVs3QBat/T5a4DwLIH48/H3GFo2EyQcFSYbNTpQEz47t
 gMKoPqyajBpa/Eulq55NTYvmgMJC3wYj4Tog1Md6sqmLtnj2HhRvqcYzw
 IFIr1SdXxu/hCVjlvVSIRzPCplVExQAKLC4qGcYAN26LjmjsxhSwmnrgB
 qUYzQDkiKdve+nXzcckvN1Z7mNpLUkMrD/QnczXNbl0alIZNbKjRyV+zh w==;
X-CSE-ConnectionGUID: 867jZzsKS5WepC1ev6l20w==
X-CSE-MsgGUID: nlFKNVUtSwC5E1vv2kDFyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="35156231"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="35156231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 09:44:50 -0700
X-CSE-ConnectionGUID: 6Zy0hOEkQ3CKSs2o1X6bsw==
X-CSE-MsgGUID: DhoBM0HSRHC9md8g5sTfWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25154596"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 09:44:49 -0700
Date: Thu, 25 Apr 2024 18:44:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/device_reset: move later skips into subtests (rev3)
Message-ID: <20240425164446.lmd7cstzvl7hvqts@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240425140544.41750-1-kamil.konieczny@linux.intel.com>
 <171405854591.1667639.11449798164959104525@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171405854591.1667639.11449798164959104525@8e613ede5ea5>
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
On 2024-04-25 at 15:22:25 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/device_reset: move later skips into subtests (rev3)
> URL   : https://patchwork.freedesktop.org/series/132040/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14654 -> IGTPW_11071
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11071 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11071, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/index.html
> 
> Participating hosts (41 -> 39)
> ------------------------------
> 
>   Missing    (2): bat-arls-1 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11071:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gem_contexts:
>     - bat-arls-2:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/bat-arls-2/igt@i915_selftest@live@gem_contexts.html
> 

Unrelated to device_reset test change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11071 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-arls-2:         [ABORT][2] -> [PASS][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14654/bat-arls-2/igt@i915_selftest@live@gt_lrc.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/bat-arls-2/igt@i915_selftest@live@gt_lrc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10911]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7824 -> IGTPW_11071
> 
>   CI-20190529: 20190529
>   CI_DRM_14654: afe74c645ec61ebe1c406646725e8d869b0b3e9c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11071: 8b945b7442d79b8ef0234661d279be7197717fe5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7824: 7824
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/index.html
