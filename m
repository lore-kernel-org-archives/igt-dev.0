Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED7BC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 11:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C9B10E03F;
	Fri, 21 Jun 2024 11:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4Tvi8hc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1D310E03F;
 Fri, 21 Jun 2024 11:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718969799; x=1750505799;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K7+xSZ1l//DBLcH1JMsMLw/rkgKyXDgoPNw+L0vcre4=;
 b=Q4Tvi8hcUzcNT0+vvcZRlQ4fUtgy+TkADmFtdYp77wvSnYE85yEgbSgI
 huK4yQwOhURwlBcVjlp5nlBf3S5Z7zaSe1j3/4eEXRS6dWtSnbFQJXUTK
 pPn7yUYCnSY4DC8SjfMEx5GqzoC73qrZrdoy/MfCoqJzLyMdjA3/URJyB
 aMzfPyUooPTdfix6iiokemadilQJuHuY57Rfoh2fmXvNx658cWpoJCMW9
 mKA66ncoH2IAxn7xeUnF+QNH/DOCC6kqNjM4wQk9wxh9NUTGOhavkrXRc
 4GevuNewHMuwaWnnimm9093qUsA0kaHF2qLXx2vzRlpDYaWr2gRNR/g7v A==;
X-CSE-ConnectionGUID: AYcbLoHvSDyMveqNJ8wm7Q==
X-CSE-MsgGUID: UAOH3CGoRn6nwN2lhxQDzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="12181344"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="12181344"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 04:36:38 -0700
X-CSE-ConnectionGUID: YnJPHt3oSZWU4OtngrEi/g==
X-CSE-MsgGUID: WHP2PUZfS5u4yf5SZowuZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="47510150"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 04:36:37 -0700
Date: Fri, 21 Jun 2024 13:36:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests=2Fkms=5F?=
 =?utf-8?Q?getfb=3A?= Skip getfb2-accept-ccs subtest on Xe2 platforms
Message-ID: <20240621113633.fmtoetdkxw4vwkax@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pranay Samala <pranay.samala@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240621043248.612664-1-pranay.samala@intel.com>
 <171895310895.130958.1592512743398178393@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171895310895.130958.1592512743398178393@a6498e030952>
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
On 2024-06-21 at 06:58:28 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_getfb: Skip getfb2-accept-ccs subtest on Xe2 platforms
> URL   : https://patchwork.freedesktop.org/series/135150/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7894_full -> XEIGTPW_11292_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11292_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11292_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11292_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/shard-dg2-436/igt@xe_pm@s4-basic-exec.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11292/shard-dg2-432/igt@xe_pm@s4-basic-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [DMESG-WARN][3] ([Intel XE#1214]) -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/shard-dg2-434/igt@xe_module_load@many-reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11292/shard-dg2-463/igt@xe_module_load@many-reload.html
> 

These are unrelated.

Regards,
Kamil

...cut...
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7894 -> IGTPW_11292
>   * Linux: xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357 -> xe-1511-e4bc04d75460a450293212fd0dd59651de6baabc
> 
>   IGTPW_11292: 11292
>   IGT_7894: 7894
>   xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357: 65ef303b3a8a20609f394e0a823ade01cb4f1357
>   xe-1511-e4bc04d75460a450293212fd0dd59651de6baabc: e4bc04d75460a450293212fd0dd59651de6baabc
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11292/index.html
