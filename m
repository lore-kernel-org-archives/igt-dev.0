Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE80606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R0prUR2p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E802B10E2E0;
	Wed, 28 Oct 2026 12:40:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4A310E2E0;
 Wed, 28 Oct 2026 12:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793191135; x=1824727135;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Gwvyno7Wb/aflwioilgAJkFaQrfOs52+rtR2Pl1adSg=;
 b=R0prUR2ptQNSp+Dmbh5ocfwWXxKxSMkFs1s2NdKwmtCUkz3lcWLLXVBq
 WiWNVFDXqqmJkGi7qFmPBSectOlLXwExFNvf1SNhnLl8PW7xjOb1C/HBz
 af6tZklZg1w1kt6L19qCgH3h3xpGZQCU/yHIHShpCTasqevH9GAxbEt91
 gtr97dAxhD/myK0wgVgV8+rGayXAOGYnXakeW6ULU0pFpVAGxGbv2LbyH
 yCUcfYgYwrq8Rrbmh8ZXQzbPH36xHSHMqwruWR5JD8WMoMCCcN0uuC0dg
 jKAu6NznZbyZp3QE2mhEKI5duLm8VAAwv40kOmDUh9zu2Wm/lCrN0isjg g==;
X-CSE-ConnectionGUID: tFNkH+1sQUu5IvgYljJ4/A==
X-CSE-MsgGUID: s9gTnJdBSlSBxckMp2YFpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1899501"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1899501"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 05:38:55 -0700
X-CSE-ConnectionGUID: aoxNVTEOTdmpmwBO0Z791A==
X-CSE-MsgGUID: d8CA+nmVTySy6wuKesomGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6597214"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 05:38:54 -0700
Date: Wed, 28 Oct 2026 13:38:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 Runner: report test command line (rev2)
Message-ID: <20261028123852.oh3seomdfsyugxfs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20261026141702.44811-1-kamil.konieczny@linux.intel.com>
 <179306016493.73748.3979678951186374005@221881a7231d>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179306016493.73748.3979678951186374005@221881a7231d>
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
On 2026-10-27 at 00:16:04 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Runner: report test command line (rev2)
> URL   : https://patchwork.freedesktop.org/series/151715/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9165_FULL -> XEIGTPW_16047_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_16047_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_16047_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_16047_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-edp-1:
>     - shard-ptl:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9165/shard-ptl-4/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16047/shard-ptl-4/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-edp-1.html
> 

Unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_16047_FULL that come from known issues:
> 
...cut...
