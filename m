Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B45D58B00
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 12:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0F310E037;
	Mon, 23 Mar 2026 12:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwO7AMt6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5D910E037;
 Mon, 23 Mar 2026 12:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774269242; x=1805805242;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DY60eDRLLj/dvdsf+yfJXqegX3IKvWWtayX65yxiFX4=;
 b=nwO7AMt6Lzv4LbVsWoHVtNJ75gpJc4I+Y6AIOkFTJ40hLNHvUpMAGEQ4
 WWsneRo2UB4pnYmOI4U03/ky/Nt3u9gEuZ3wFeXTpGx2muvV287OrfcXD
 C1uCwLC36bLZ98P+5dWiQdCPFyBEX07cT6yhtDtB955a0ZnnZw+nHCto0
 O2/3G3KK+6NsXBk7K9kX5d//o3u4zZNcEPwP3ohj5O5Yd3SQyZr7le08t
 Js+wG5o+y68HhPTOgNWA0ccx8d8+NQg/Ba2BITjvIGzCqQCtwSYk4RS4q
 5+Zx+F4RpSnN7gBvv9LxjB6/KrC9SdLHkg8KrW6f7Rk8UNaxZ1mHDlmOi w==;
X-CSE-ConnectionGUID: c7dYPqMVQaG5iPYIZK/UBQ==
X-CSE-MsgGUID: gjwZcc7+SPu90Y46dhMVIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86629886"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="86629886"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:34:02 -0700
X-CSE-ConnectionGUID: We7nYKEjTg2v5oysEebzFg==
X-CSE-MsgGUID: fYhLHHOeStm2nYsRdOA58Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="223084458"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:34:01 -0700
Date: Mon, 23 Mar 2026 13:33:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 tests/kms_dp_aux_dev: Create basic subtest
Message-ID: <20260323123358.j2xfgej57hgj55ze@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260319141501.33758-1-kamil.konieczny@linux.intel.com>
 <177402230382.379016.893467080364785050@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177402230382.379016.893467080364785050@a3b018990fe9>
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
On 2026-03-20 at 15:58:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_dp_aux_dev: Create basic subtest
> URL   : https://patchwork.freedesktop.org/series/163534/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8811_FULL -> XEIGTPW_14812_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14812_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14812_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14812_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@absolute-wf_vblank-interruptible@d-dp2:
>     - shard-bmg:          [PASS][1] -> [FAIL][2] +3 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8811/shard-bmg-4/igt@kms_flip@absolute-wf_vblank-interruptible@d-dp2.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14812/shard-bmg-6/igt@kms_flip@absolute-wf_vblank-interruptible@d-dp2.html
> 

Unrelated.

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8811_FULL and XEIGTPW_14812_FULL:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_dp_aux_dev@basic:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.07, 0.30] s
> 

This looks ok, please note that there is now new subtest
igt@kms_dp_aux_dev@basic

which is the same as old igt@kms_dp_aux_dev

Regards,
Kamil

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14812_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +8 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14812/shard-bmg-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
...cut...
