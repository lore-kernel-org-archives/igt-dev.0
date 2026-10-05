Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C9ECA5FCE
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 10:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3896210E24C;
	Mon,  5 Oct 2026 10:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ST1sigUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFD410E0D2;
 Mon,  5 Oct 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791196115; x=1822732115;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x6bk4isPgceJ/m8YKi6qeEG37UTkrnBSgRRtLtqo6ms=;
 b=ST1sigUUwxwYgGBi0BCpfYt8At0TcR9UVN19T8pBgjs8R6T48/uO3yZ+
 ZlFkDUCSBvZk1u6OQKHvqxZPHgbTfDVW6G8PqASLQ+bfB9yFbO0ksORwp
 YNV/aE6K/tdfbYjqU8sT0RSBri3eItUzRMVql4HmdmuwZhErW655Ewbhk
 F7IfnvuYaN8XL5DO12sgq3JhojQx7rY79FaVlcUKEez5oxBVGbNorYN+1
 B7H0WUOv07tcUbZ56BTk8GLt3gbYbO290j92WNSklvY3pe6bP+xtvl4rQ
 2kZuP3Nx/m9RtSVAXj3ksyUOcMriVJDfaBSKTz12N5eFbmMc5Icr7eCQU Q==;
X-CSE-ConnectionGUID: lG/LD1ZASuuVWOPZ8kKY4w==
X-CSE-MsgGUID: jJpS53b2REW3LA3aLvEjsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90898004"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="90898004"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 03:28:35 -0700
X-CSE-ConnectionGUID: HaNsT6BmT5KA5RfhhVPZ4Q==
X-CSE-MsgGUID: CawhUaaHSUuBzWie5BOzHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="830792"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 03:28:33 -0700
Date: Mon, 5 Oct 2026 12:28:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 runner/executor: Fix writing endtime
Message-ID: <20261005102831.gyzzosxh7hkdt2fd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20261002130522.42708-1-kamil.konieczny@linux.intel.com>
 <179102838275.236081.14714507546127892100@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179102838275.236081.14714507546127892100@61270ab9df2a>
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
On 2026-10-03 at 11:53:02 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/executor: Fix writing endtime
> URL   : https://patchwork.freedesktop.org/series/175420/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9125_full -> IGTPW_15935_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15935_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15935_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15935/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15935_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s3-devices:
>     - shard-mtlp:         NOTRUN -> [FAIL][1] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15935/shard-mtlp-4/igt@gem_exec_suspend@basic-s3-devices.html
> 
>   * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d:
>     - shard-mtlp:         [PASS][2] -> [ABORT][3] +1 other test abort
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9125/shard-mtlp-2/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15935/shard-mtlp-4/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-mtlp:         [SKIP][4] ([i915#9688]) -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9125/shard-mtlp-3/igt@kms_psr@fbc-pr-cursor-plane-move.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15935/shard-mtlp-4/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 

Unrelated,


Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15935_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8411])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15935/shard-dg1-18/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
...cut...
