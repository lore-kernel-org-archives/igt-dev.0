Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7DFC5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 11:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EB210E1A1;
	Mon, 26 Aug 2024 11:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J62NupDB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FA410E19D;
 Mon, 26 Aug 2024 11:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724670141; x=1756206141;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3HdQDAAlh8eXnDAvOCO4iOZLzJFxR2OV9S9dJv3sHfc=;
 b=J62NupDB1ZSvytP9bnljhppmypbRlEf0aeEiTEmhAzuHA7TrAf5pCZdC
 HrQAiRGQPV9tvfw/Uy4+A7QUsCs0E5JCOW+/Y+qu5SQ7b+Hn8szfAVCEw
 oWCp8gTRv4GJbyS1+FqQY6qBkgQQKwEzrsSnJ18syMpmuC2w18saIFDOf
 JG2WI+nOb9iIUxlHmbIqCwtO5U94AgCZ/YQlnOwyW6Q/fegqIGs0dHALF
 VJ6MYuULVcjnP/hA6zDQROZzT1BlaBrO47XpZ24zLy+cTHE+31ig1pI7V
 /TwFbNz2l0GytbCZU3ZO/WpPH6eq6wy8c1S5QqwjNaISOCX4z8djZ+l3J A==;
X-CSE-ConnectionGUID: HD0rE3XtRAaDnzkirqIfQg==
X-CSE-MsgGUID: v5h0/ds6RDKoN5qSc6GrNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33652816"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="33652816"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 04:02:21 -0700
X-CSE-ConnectionGUID: 2GjoLwbTTZ28gsiZgEUE+w==
X-CSE-MsgGUID: 4YLldeBRSyCOFkiRB9iDtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="93276267"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 04:02:18 -0700
Date: Mon, 26 Aug 2024 13:02:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 runner/settings: set PRUNE_KEEP_ALL as default (rev2)
Message-ID: <20240826110214.5otzrsi3g4t3ilkw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240823161409.79198-1-kamil.konieczny@linux.intel.com>
 <172459680557.765922.9593320479885112828@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172459680557.765922.9593320479885112828@2413ebb6fbb6>
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
On 2024-08-25 at 14:40:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/settings: set PRUNE_KEEP_ALL as default (rev2)
> URL   : https://patchwork.freedesktop.org/series/135116/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7989_full -> IGTPW_11625_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11625_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11625_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/index.html
> 
> Participating hosts (8 -> 9)
> ------------------------------
> 
>   Additional (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11625_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@drm_fdinfo@most-busy-check-all:
>     - shard-rkl:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][2] +5 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>     - shard-glk:          NOTRUN -> [FAIL][3] +2 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][5] +5 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>     - shard-tglu:         NOTRUN -> [SKIP][6] +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-snb:          NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 

Unrelated to change in igt_runner.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11625_full that come from known issues:
> 
...cut...
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/index.html
