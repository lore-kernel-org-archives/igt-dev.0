Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A33C79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 11:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADB910E274;
	Thu, 10 Sep 2026 11:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2T4MIey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6134010F466;
 Thu, 10 Sep 2026 11:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789040116; x=1820576116;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=i3v5Ge+OoH35GuzBAUIgz40qf/dePF5sqePxg8y5jRA=;
 b=B2T4MIeyurhebEEixyDQTde0rJ4Jw6Cr4Yk5zD1pZMuMXhe54rhAyr9X
 63hEXjpCJgZLAbCVFqdNqbWLqfiLVQcWjGux1M+g5SMxBk2AvrewLBk2N
 jQtHNvtk8buT8qqBGLAugj7tcPCBlAHSrIkHfWOIroav+Br1806ONKdU9
 oQgNunqF9fIFoMqKfcb4RGEXzglccYEoY90pODvYfbZ4upfmfZKZx/+ik
 tTQJDye5jTf2bg6jdRufRcx86Y+RASiCFKXXMC9zS6U6b1ARn8kISdQSf
 eytl32eFmvxANedy55gimrcysS+/w8zIgxIjGKl/n3NJ2lQzdgS9gPprf Q==;
X-CSE-ConnectionGUID: Hhq5bAhSQyShYNiM2GVSlw==
X-CSE-MsgGUID: vUrG3mOmQFKUEtHpACqOPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89527195"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89527195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:35:16 -0700
X-CSE-ConnectionGUID: iaOhCzHDSX+utL0Da8hgJA==
X-CSE-MsgGUID: tf2uZGwVSfi5loNZq5h3OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="267324053"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:35:15 -0700
Date: Thu, 10 Sep 2026 13:34:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 lib/igt_core: Make build reproducible
Message-ID: <20260910113458.cjtjgyya7cyzlr4t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260909133320.71100-1-kamil.konieczny@linux.intel.com>
 <178898204040.144085.10572799684504177658@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178898204040.144085.10572799684504177658@61270ab9df2a>
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
On 2026-09-09 at 19:27:20 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: Make build reproducible
> URL   : https://patchwork.freedesktop.org/series/173723/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9088 -> IGTPW_15815
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15815 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15815, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15815/index.html
> 
> Participating hosts (39 -> 38)
> ------------------------------
> 
>   Missing    (1): bat-dg2-13 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15815:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@load:
>     - fi-bsw-n3050:       [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9088/fi-bsw-n3050/igt@i915_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15815/fi-bsw-n3050/igt@i915_module_load@load.html
> 
>   

This is unrelated, please file a bug and run FULL i915 testing.

Regards,
Kamil

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_9088 -> IGTPW_15815
>   * Linux: CI_DRM_19108 -> CI_DRM_19114
> 
>   CI-20190529: 20190529
>   CI_DRM_19108: dd822035c9dcd89e47cbfa75da6f3119617fbada @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_19114: 06a7934b744f58f0264164fe6173f00c22b47bc4 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_15815: 15815
>   IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15815/index.html
