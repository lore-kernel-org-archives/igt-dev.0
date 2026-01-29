Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E38D6B09D
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 17:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835EA10E28F;
	Thu, 29 Jan 2026 17:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tx6VoyuU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A9910E28F;
 Thu, 29 Jan 2026 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769706098; x=1801242098;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n7+hxZ/EustzvVu1vjlKoCxpV5W8jPfmUusa/n/g2oc=;
 b=Tx6VoyuUY+3oMd1Ce1lfvp5pUtoKGs+QyVWkkQK5ezqmPPHbUq0/Rvpj
 Y4Z2Mx4cALvgcO129VmNVp94NC2tg+etvPXY5My6ZcAK+4exech7Isln5
 GCAIzEB/x0GbofBHrvGg2WjBuf3uqj8hF7pZ+rkZzjtc76UzjAY5L4UWU
 PQXbv0nueW4Howj5DZoD3cduhFBDa9O7NmXHR2ptttyfOhMXhbeTCYzVa
 qxkttyyxGwWkco5had9koWFkXPAVXVzXB5dJXwcUjJhfJSLNXSytJrLEQ
 ELfHtEblFBsmeql/16dL94KNO9kbyxeucU1c9UkcSIGUWY80BA3b7bySw w==;
X-CSE-ConnectionGUID: w3XoJmLcQq+FDNYfv7cl6Q==
X-CSE-MsgGUID: nVEXhKTnRbi8EYn5BthVyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="93608542"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="93608542"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:01:38 -0800
X-CSE-ConnectionGUID: a7t66avTSG2a+R2afRJDNw==
X-CSE-MsgGUID: zJ7GeUq0TCmzeDWXztNf0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="207752265"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 09:01:36 -0800
Date: Thu, 29 Jan 2026 18:01:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Runner: Use Jansson instead of json-c (rev3)
Message-ID: <20260129170134.5bp2jnjhl7vpubqw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
 <176969558655.205866.2409217750085891957@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176969558655.205866.2409217750085891957@a3b018990fe9>
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
On 2026-01-29 at 14:06:26 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Runner: Use Jansson instead of json-c (rev3)
> URL   : https://patchwork.freedesktop.org/series/160154/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17900_full -> IGTPW_14436_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14436_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14436_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14436_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-11/igt@gem_lmem_swapping@smem-oom.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/shard-dg2-11/igt@gem_lmem_swapping@smem-oom.html
> 

Unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14436_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/shard-dg1-14/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-tglu:         NOTRUN -> [SKIP][4] ([i915#11078])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/shard-tglu-2/igt@device_reset@cold-reset-bound.html
>     - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#11078])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/shard-rkl-4/igt@device_reset@cold-reset-bound.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#14544] / [i915#7697])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/shard-rkl-6/igt@gem_basic@multigpu-create-close.html
>     - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#7697])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/shard-dg1-14/igt@gem_basic@multigpu-create-close.html
>     - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#7697])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/shard-tglu-5/igt@gem_basic@multigpu-create-close.html
>     - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#7697])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/shard-mtlp-5/igt@gem_basic@multigpu-create-close.html
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#7697])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/shard-dg2-4/igt@gem_basic@multigpu-create-close.html
> 

...cut...
