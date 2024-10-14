Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ADBCF2590
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 05:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECD210E270;
	Mon, 14 Oct 2024 05:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnPQ2rl2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D878C10E26F;
 Mon, 14 Oct 2024 05:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728883544; x=1760419544;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=hIAXofwmBT1VJ+Hb1h9SjeJXbGI3n8KP9wmtpqESjng=;
 b=KnPQ2rl2LqPs7Seok8wncKe18jgVCGb/PwE99np2KedHQQggIk2pSTRL
 n22Jy1QFOF3J3dRJEIk45HqFh8ShKHMKHuEvUufbjhqaE4J83QJj+YtY7
 aEbT0Xu16XC1gwXo3UgeVLUJh5HOvE6xM4fWXLiuIPFB9se6767ROUA7P
 7/sREPPk3OU6tPUDpXP7wqmqeLCakLjZNXZSLzCdabwKymnAXVSsyp8gp
 7ZgjTGWTe5dJChmygTd1s/NGINpRp/voWMiwK64EO7XKaqsl3khhOWIW6
 HrzFS4w/ei2IIBNKv613iLCBz4HQS2pXerTgo9CzII6U8NpSr3yK2Qgsr w==;
X-CSE-ConnectionGUID: /AwUUfYxRKWGoTZ7JR1n3g==
X-CSE-MsgGUID: Cfx7DhQiTfCWoq63xnTeTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="45716319"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="45716319"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 22:25:43 -0700
X-CSE-ConnectionGUID: 6HwHwaPjRmiDRZyZSvyEuA==
X-CSE-MsgGUID: 3sEPt+drSHS8PrCPke+eag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="82039810"
Received: from cscleary-mobl1.ger.corp.intel.com (HELO [10.213.202.134])
 ([10.213.202.134])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 22:25:43 -0700
Message-ID: <89e0b566-6af7-47dd-8090-51e1c8f6de39@linux.intel.com>
Date: Mon, 14 Oct 2024 07:25:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/xe?=
 =?UTF-8?Q?=5Fpm=3A_Fix_code_style_issues_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <d779e0b6-46c7-4345-b9f9-75fe61e3cb2b@linux.intel.com>
 <172781790041.1143800.3127418124277242020@2413ebb6fbb6>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <172781790041.1143800.3127418124277242020@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915,

On 01.10.2024 23:25, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pm: Fix code style issues (rev2)
> URL   : https://patchwork.freedesktop.org/series/139357/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8047_full -> XEIGTPW_11851_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11851_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11851_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11851_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_3d:
>     - shard-lnl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11851/shard-lnl-3/igt@kms_3d.html
> 
>   * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8047/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11851/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [FAIL][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11851/shard-lnl-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11851/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][6] +1 other test abort
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11851/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html
> 
>   * igt@xe_tlb@basic-tlb:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11851/shard-dg2-435/igt@xe_tlb@basic-tlb.html

These are unrelated to my change.

Thanks,

Peter
