Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B627C87FCF
	for <igt-dev@archiver.kernel.org>; Sun, 10 Aug 2025 09:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25ACA10E247;
	Sun, 10 Aug 2025 09:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOAYKaBX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A25310E247;
 Sun, 10 Aug 2025 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754818959; x=1786354959;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=EsCvtLB8KH/luSp8oFFqVk/cePNfnDqON3zQX4gbUNc=;
 b=DOAYKaBXKDxRzAsPQxQTWHKhet6vUdxFXajt5U448Xs/avSBoim1b2pz
 cWNpUcdpiynhJj5zu5YcAI7J+lGv2fGWBmTx0kNggznhfidrewcj40lVp
 gSPOj/GxAfbAh/IMRgDKCVAcbjVHFWVzy+OTbhR0hwPg6NsoKEmcSPjZk
 T6DuvUUKxuzEzdR1hQv+9f5CuqHuXwaHPv3NdxKkMWRr+EBsrlZI+Oo8D
 nttL4bb4G+mmsLIbKHOtKNxFK4sA17pMNl1+x8RIApMRWInmxYc9XfjQW
 HgsEx0GKatDHbivrLQXGR+X2ezlsUQFdy+f0+7M0O6362W5Vjrk+ps2aH A==;
X-CSE-ConnectionGUID: cFYLMw3/TMesbJaurENYzA==
X-CSE-MsgGUID: +n3bvNE7TZCLZ+m45AyL7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="74684942"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="74684942"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 02:42:38 -0700
X-CSE-ConnectionGUID: GxCmyJ6QTbKAmS/xSnll+A==
X-CSE-MsgGUID: GTqPlkL/QFesldYS212n0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="189370729"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 02:42:37 -0700
Message-ID: <3379ee2e-a096-4306-9ede-6ad0e89f3685@linux.intel.com>
Date: Sun, 10 Aug 2025 11:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBsaWIvaWd0X2Rp?=
 =?UTF-8?Q?r=3A_Use_actual_length_for_string_termination?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250809131858.71685-1-peter.senna@linux.intel.com>
 <175475375863.224736.9511115967081464919@1538d3639d33>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <175475375863.224736.9511115967081464919@1538d3639d33>
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

Der I915,

On 8/9/2025 5:35 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_dir: Use actual length for string termination
> URL   : https://patchwork.freedesktop.org/series/152724/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8489_FULL -> XEIGTPW_13564_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13564_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13564_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13564_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8489/shard-bmg-4/igt@xe_ccs@suspend-resume.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13564/shard-bmg-6/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map-nomemset:
>     - shard-lnl:          [PASS][3] -> [FAIL][4] +3 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8489/shard-lnl-7/igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map-nomemset.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13564/shard-lnl-7/igt@xe_exec_system_allocator@process-many-execqueues-new-bo-map-nomemset.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
>     - shard-dg2-set2:     [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8489/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13564/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
>     - shard-bmg:          [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8489/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13564/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
>     - shard-dg2-set2:     [PASS][9] -> [DMESG-WARN][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8489/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13564/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-dg2-set2:     [PASS][11] -> [TIMEOUT][12] +1 other test timeout
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8489/shard-dg2-436/igt@xe_pm_residency@gt-c6-freeze.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13564/shard-dg2-433/igt@xe_pm_residency@gt-c6-freeze.html
> 

These are unrelated. Thanks.

[...]
