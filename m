Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891CBC43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 11:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3525B10E91F;
	Mon, 13 Jul 2026 11:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAzf0pBX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5B610E905;
 Mon, 13 Jul 2026 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783942259; x=1815478259;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jZo4ZsRNi7vJUtqOBTlYghFK+/Hg2KSbuLTiWnQw9HI=;
 b=VAzf0pBXpVFgYJezEEmSJ64pYS/xj4Yq2MmNla1PDKfgQ/cckfwGCeA7
 atH8CTjMUdqnysbEJleoTQlYoRk4xokClB9NiskuDkOELjS5oVvbXSycF
 eA4doIZn0XtMy0qmBIH2/JXmj2YgvO1n0iocJcTH4o8ADi83ehEb2Oxkh
 /L5OcFeI8Wk+vBq1zTuDxWbderTrWg6RzJBB6vf7pky4cbWQ0Ca/Lkegn
 EGT/F6kBIlFMOzMo7raH9YMaad1OzXKuLSDF8BAvuocuQRsnvMFyhcYol
 pn3XPUgFrmjF+SjDQ/iHWS4mUfWKSSi96ZSf5Pjdf77Q1EKVZl+TCoWJN w==;
X-CSE-ConnectionGUID: PbkrmfYCRBqjipI3ZpIKyQ==
X-CSE-MsgGUID: kwAIWFaeQNOt3J81AELDEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83665947"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83665947"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 04:30:59 -0700
X-CSE-ConnectionGUID: jEQEogulSy6WPEje9Yet8w==
X-CSE-MsgGUID: OYyPWCi/TJGIAwrGI/VlOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278784073"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:30:57 -0700
Date: Mon, 13 Jul 2026 13:30:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bernd Kuhls <bernd@kuhls.net>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_st?=
 =?utf-8?Q?arting_with_=5Bi-g-t=2C1=2F2=5D_tools=2Fintel=5Fgpu=5Ffrequency?=
 =?utf-8?Q?=3A?= include limits.h to fix musl build
Message-ID: <20260713113055.6qo6fex6dux6qelr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Bernd Kuhls <bernd@kuhls.net>,
 I915-ci-infra@lists.freedesktop.org
References: <20260710184619.2347456-1-bernd@kuhls.net>
 <178380543421.179010.876942090815892044@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178380543421.179010.876942090815892044@6beec6c84f66>
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
On 2026-07-11 at 21:30:34 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] tools/intel_gpu_frequency: include limits.h to fix musl build
> URL   : https://patchwork.freedesktop.org/series/170207/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18804_full -> IGTPW_15512_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15512_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15512_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15512/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15512_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_isolation@preservation-s3@bcs0:
>     - shard-tglu:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18804/shard-tglu-6/igt@gem_ctx_isolation@preservation-s3@bcs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15512/shard-tglu-9/igt@gem_ctx_isolation@preservation-s3@bcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
>     - shard-mtlp:         [DMESG-WARN][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18804/shard-mtlp-6/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15512/shard-mtlp-7/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html
> 

They are unrelated, series changes a tool and xe test.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15512_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
...cut...
