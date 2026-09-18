Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB368C982D2
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 08:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9683710F265;
	Fri, 18 Sep 2026 08:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8BhCX5e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC15C10F295;
 Fri, 18 Sep 2026 08:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789718615; x=1821254615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qKiwPo+bw04T5NSjPaZpd12f85dXLM2ZH6R6MRUvTys=;
 b=h8BhCX5ejaIWCihzLhjgtLdHMX09pnOxKD1FkMgzsYSQZYoEd2HUeMx2
 fTpaKMcdP6nDdRmJ3SJm79AMJFDLF02Mk15onFbOlDkmNkhttfn/KYFGl
 8LPB+N5MYSJaOaNwwI9TWkBWgknqJPg5rlECuT9AdbPX8q23uW9F6SFgM
 X0u89qASj1Zoya2DIMcKk1Dj3M4FAr/+k4ai7BNIa7zHvmqrF2sMny3EW
 yTNAPX1F0LWAQoFjtRyvZlVnSi5zm+uTP0NSZYbNGJupCnrZ7qiOISf+3
 FjLgAURr1v0LNL3TjdwpRcQfxtGuS28XIhML83ue8pbEfzNzGf/+pBhdC w==;
X-CSE-ConnectionGUID: 6A9MY9BoSdm3dsCyr/FcQw==
X-CSE-MsgGUID: 3QJz4kkfQjKNyIxeUHW5bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="710246"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="710246"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 01:03:35 -0700
X-CSE-ConnectionGUID: c2evP/J6T12EYZqJ5n5SLg==
X-CSE-MsgGUID: BMYybWdeRO+QgE5jMgqXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="276238191"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:03:33 -0700
Date: Fri, 18 Sep 2026 10:03:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 lib/igt_core: Make build reproducible (rev3)
Message-ID: <20260918080316.24q4j7j6i53yi7at@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260917145331.78274-1-kamil.konieczny@linux.intel.com>
 <178966716334.177999.7831532791616823995@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178966716334.177999.7831532791616823995@61270ab9df2a>
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
On 2026-09-17 at 17:46:03 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: Make build reproducible (rev3)
> URL   : https://patchwork.freedesktop.org/series/173723/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9099_FULL -> XEIGTPW_15858_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15858_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15858_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 3)
> ------------------------------
> 
>   Additional (1): shard-ptl 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15858_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9099/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - {shard-ptl}:        NOTRUN -> [SKIP][3] +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/shard-ptl-8/igt@kms_hdmi_inject@inject-audio.html
> 

Not related.


>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15858_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_3d@basic:
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#6011])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/shard-lnl-7/igt@kms_3d@basic.html

Please ignore this one on Xe, test needs connected display but in log
there is: No HDMI connector found

Regards,
Kamil


> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][5] ([Intel XE#3718] / [Intel XE#6078])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
...cut...
