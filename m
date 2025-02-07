Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36599C02192
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 07:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02FC10EA3D;
	Fri,  7 Feb 2025 07:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORSY01De";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FCC10EA3D;
 Fri,  7 Feb 2025 07:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738914670; x=1770450670;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=oG9sea1fN4U0hnzPPBthGdNaqqNhZ+7uSscd7OoVdfQ=;
 b=ORSY01DeHAMqj9mO88WbiL0aVNmhg3UediOT7ktuq0fRQIJD2dttsIYr
 yahQp3z3vuwkvBQxDaRkX5WHzDNw+3y5dIhuOmo3ZogwapUUek+laFgtU
 jzJvEVu0Utob5CBM7htClax4xyzmn6ziucSBVFk7dajxePWe7oBQMWylx
 3Gik6gm4GDMplUMHOf70VrxwNNV5NzzT2Ptd6paL3KG8LJ81dIaJZ4jRC
 dzJs9n09pSw4fp8rwM5fZImVmje4cMRubltPj1fNpBE7vk2EaPz/hsZrz
 AkE0uQ0e1h9QfvnFFeLEkn4Wxq7YUn2pKlHFeF+nRPFVnKFMx7l0xyFVx A==;
X-CSE-ConnectionGUID: o7CfczM+TaaTYWsk6MJwrg==
X-CSE-MsgGUID: Iatdzo3DTMCZK4af5Xh6RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38750901"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="38750901"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 23:51:10 -0800
X-CSE-ConnectionGUID: OeQK6uhzSZaG1wgljXezBA==
X-CSE-MsgGUID: ak4RwzmAQTu3M2B/K3Usqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111280967"
Received: from pkoski-mobl1.ger.corp.intel.com (HELO [10.245.83.54])
 ([10.245.83.54])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 23:51:09 -0800
Message-ID: <c6213cd1-9446-45f0-b929-cfc2064d716f@linux.intel.com>
Date: Fri, 7 Feb 2025 08:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Bump_aborti?=
 =?UTF-8?Q?ng_on_network_failure_deadline_to_40_seconds?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <173889365437.2324859.7581750241661887454@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173889365437.2324859.7581750241661887454@b555e5b46a47>
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

On 07.02.2025 03:00, Patchwork wrote:
> == Series Details ==
> 
> Series: Bump aborting on network failure deadline to 40 seconds
> URL   : https://patchwork.freedesktop.org/series/144424/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8224_full -> XEIGTPW_12556_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12556_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12556_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12556_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@plain-flip-ts-check@a-edp1:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@a-edp1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12556/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@a-edp1.html
> 
>   * igt@xe_module_load@reload-no-display:
>     - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@xe_module_load@reload-no-display.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12556/shard-dg2-464/igt@xe_module_load@reload-no-display.html
> 

These are unrelated to my change. Please fix and re-run.

Thank you!


