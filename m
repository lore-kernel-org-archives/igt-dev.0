Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CEDD12D71
	for <igt-dev@archiver.kernel.org>; Mon, 11 Nov 2024 05:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF5110E116;
	Mon, 11 Nov 2024 05:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQLgQVtp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B1D10E116;
 Mon, 11 Nov 2024 05:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731304543; x=1762840543;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=RmVRPMTmRh3GMungWKw8KIGIC6YlfYXtuBmVMOs4U9c=;
 b=gQLgQVtpypuMdZ6CrOmwFL569+v2gq3eJCAeTVaSiJDxRmmSQvsX2CFC
 wG4cFj5vrvmtzhyblK32x3AMJCUcwWFqhp0vDDbnn37o+BsoSXNlfoKkd
 q6JYWO6Ff5Ga/FfXpOSVWWhO56MnL7nchLPr05Ur8KbT0zoHMiKHJ5IXu
 QLsCwyaP2sQR+mVjH3FMjHZ6/PPqxcz9gyIpZ0vkIxarbo0GZRTKUMsAe
 PWUCgBNgAmRgPXvKRA+ze5MlH0IeSzrtiTxXJh3STX5dRtZ8ooXu/r6+A
 RaKfSrFpL9Wu5aIt67fS05E/xI6JIx2WPzKKpqB0pFFEU/M6l1PawLkVU A==;
X-CSE-ConnectionGUID: N8HQ4IArRDiVk1GC5zeifQ==
X-CSE-MsgGUID: Wvyye6bbSKaTMoyTgq0SGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31265229"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31265229"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 21:55:43 -0800
X-CSE-ConnectionGUID: J8LHehXIQ7enG2VvnjDivQ==
X-CSE-MsgGUID: 5h1/+dEXTVadXp8uDqbZpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="87100239"
Received: from amajstox-mobl1.ger.corp.intel.com (HELO [10.213.195.228])
 ([10.213.195.228])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 21:55:42 -0800
Message-ID: <33e3a3e4-de17-4d99-91f5-c45973fe55bf@linux.intel.com>
Date: Mon, 11 Nov 2024 06:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeBAT=3A_failure_for_igt-runner_fact?=
 =?UTF-8?Q?_checking_=28rev5=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173114141285.1605697.17692480992262357073@2413ebb6fbb6>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173114141285.1605697.17692480992262357073@2413ebb6fbb6>
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

On 09.11.2024 09:36, Patchwork wrote:
> == Series Details ==
> 
> Series: igt-runner fact checking (rev5)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8101_BAT -> XEIGTPW_12073_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12073_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12073_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12073_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-lnl-1:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12073/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

These are unrelated to my change.

[...]

Thank you!
