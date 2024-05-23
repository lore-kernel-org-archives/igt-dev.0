Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0719C25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 14:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08452888D9;
	Thu, 23 May 2024 14:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4qo1E07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598E4888D9;
 Thu, 23 May 2024 14:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716473489; x=1748009489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o4G7/57owSHevHldhtMjhqb0sQnG8A96DCIRBGSk92s=;
 b=Q4qo1E077fN6zvPDBgz+5onIkUmwq3iHzIBhEGJENQ3Irgy/gG1h10YM
 VzeLJGudZyHeDCeXyBOr172Z7fggXjA58eJjf8+PCvNQlDDfZAMdvsnZW
 qM5h0V6AcxSGba6WR/q2WO1GMgJTBoLfbDyCZjyqZgYlV4I4DaHgN2/13
 63Lym47UWIkGCOhCcsbBK3YgWikl6neVHYaCCfgpsIJIO8ys2xhj+34Mi
 5jAqTxF20NVb2WiI/m2x6w0qhnz1nwfgDfSvgxw5ijlZeToDE4HaWnnaM
 0umQ2ES0NpEtiMUDlD0qi11HAhGJxWcRzw9FHQqHI2tsFe0yUVewQL3os w==;
X-CSE-ConnectionGUID: xJ2b5n/hQ6yqjnxKfEOSkA==
X-CSE-MsgGUID: peHkFVdoSIuLeiIOJUnzbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12571381"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="12571381"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 07:11:28 -0700
X-CSE-ConnectionGUID: YoWCpXpKQmenAxNI8Ubmug==
X-CSE-MsgGUID: YWy+z9GmR6qn8e8avbO+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="38522172"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 07:11:27 -0700
Date: Thu, 23 May 2024 16:11:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
	I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for lib:
 sync i915_pciids.h and _local.h with kernel
Message-ID: <20240523141124.agnwuvxuo5a3idj4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <cover.1716373923.git.jani.nikula@intel.com>
 <171644160176.2168809.3955013321373294230@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171644160176.2168809.3955013321373294230@8e613ede5ea5>
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
On 2024-05-23 at 05:20:01 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib: sync i915_pciids.h and _local.h with kernel
> URL   : https://patchwork.freedesktop.org/series/133915/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14801_full -> IGTPW_11177_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11177_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11177_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11177/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11177_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@dpms-off-confusion-interruptible@c-dp4:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11177/shard-dg2-11/igt@kms_flip@dpms-off-confusion-interruptible@c-dp4.html
> 

Unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11177_full that come from known issues:

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7867 -> IGTPW_11177
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14801: 60134578b28bbd5dca007a0d8abaa6daaca9ddaf @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11177: b2c2edb42403917736414e00184336a877f7cb36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7867: f3006a13799e3bc45d754aa8ad318394277d69ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11177/index.html
