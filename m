Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D33FC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 11:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D136110EE8C;
	Tue, 26 Mar 2024 11:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B22FBe98";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2DF10EE8C;
 Tue, 26 Mar 2024 11:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711451737; x=1742987737;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T8KpcWKWM0F5074ClKpGDlFLhuRBpv681FmQ1IsxaUw=;
 b=B22FBe9864P1cY9SE+/dc/tF09hpUGxWF/2YIrlMHusrdSvYl9vSSxft
 it3ykHKjTxl3hjjUkx9Fajwg0K4K3Hb2BbU5JwWVqcqFt7PRfa7IH5Oi2
 FAp26lx+wQ7lVkwwW99elbGo7URfa8TVxdgSsmt4dctLzyrEa1daw4rxF
 XtdG2z6wMu1+vuC/FoqqXDkbWAiJr2BmpUxmppIWBk9p+BQkrfVQIniLp
 0Xa8WKDlSMGCZFyviCqq/CVlEC6OxpWqxPqkGK9e3csRtWRThbOVUoIP2
 vckmGfSrEMU36x2pZAiEaG0FZLkjBTuZB199x1Yf4JGAy8ENXDdmKBXMF A==;
X-CSE-ConnectionGUID: cX1vnko5QTKUBC6cmCjvdQ==
X-CSE-MsgGUID: HfcV4qufSeyITIHOgfSFww==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6625795"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6625795"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 04:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20591631"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 04:15:35 -0700
Date: Tue, 26 Mar 2024 12:15:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 i915/gem_exec_whisper: Limit workload (rev2)
Message-ID: <20240326111532.vhjq2lqn7jw3xf64@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240325161357.2588401-1-jonathan.cavitt@intel.com>
 <171142529307.1039408.10558496569297405833@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171142529307.1039408.10558496569297405833@8e613ede5ea5>
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
On 2024-03-26 at 03:54:53 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: i915/gem_exec_whisper: Limit workload (rev2)
> URL   : https://patchwork.freedesktop.org/series/131448/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7782_full -> IGTPW_10902_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10902_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10902_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10902/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10902_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@kms:
>     - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7782/shard-snb5/igt@gem_eio@kms.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10902/shard-snb6/igt@gem_eio@kms.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10902/shard-dg1-15/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
> 
>   * igt@kms_flip@absolute-wf_vblank@c-hdmi-a1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10902/shard-glk3/igt@kms_flip@absolute-wf_vblank@c-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a4:
>     - shard-dg1:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7782/shard-dg1-15/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a4.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10902/shard-dg1-15/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a4.html
>

This is unrelated to changes in gem_exec_whisper.

Regards,
Kamil

> 

...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7782 -> IGTPW_10902
> 
>   CI-20190529: 20190529
>   CI_DRM_14479: d1ecfbbbb194e8f7941bd84f77f7c938b4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10902/index.html
